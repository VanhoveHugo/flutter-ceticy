import 'dart:convert';

import 'package:ceticy/core/app_constants.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class FriendsCreatePage extends StatefulWidget {
  const FriendsCreatePage({super.key});

  @override
  FriendsCreatePageState createState() => FriendsCreatePageState();
}

class FriendsCreatePageState extends State<FriendsCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  final TextEditingController emailController = TextEditingController();

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final contextRef = context;

    try {
      final auth = Provider.of<AuthProvider>(contextRef, listen: false);

      if (auth.isManager) {
        if (!contextRef.mounted) return;
        ScaffoldMessenger.of(contextRef).showSnackBar(
          const SnackBar(
              content: Text(
                  'Vous ne pouvez pas ajouter d\'ami en tant que manager')),
        );
        Navigator.pop(contextRef);
        return;
      }

      final url = Uri.parse('$apiBaseUrl/friends/');
      final token = await storage.read(key: 'jwt');

      if (token == null) {
        throw Exception('Token introuvable');
      }

      final body = jsonEncode({
        'email': emailController.text,
      });

      final request = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);

      if (!context.mounted) return;

      if (request.statusCode == 201) {
        ScaffoldMessenger.of(contextRef).showSnackBar(
          const SnackBar(content: Text('Demande d\'ami envoyée')),
        );
        Navigator.pop(contextRef);
      } else {
        ScaffoldMessenger.of(contextRef).showSnackBar(
          SnackBar(content: Text('Erreur : ${request.reasonPhrase}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(contextRef).showSnackBar(
        SnackBar(content: Text('Erreur : $e')),
      );
    } finally {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: 'Ajouter un ami'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                decoration:
                                    const InputDecoration(labelText: 'Email'),
                                validator: (value) => value!.isEmpty
                                    ? 'Ce champ est requis'
                                    : null,
                              ),
                              const SizedBox(height: 20),
                              PrimaryButton(
                                onPressed: _submitForm,
                                label: "Ajouter",
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Vous pouvez ajouter un ami en entrant son adresse email. Il recevra une demande d'ami.",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    )))));
  }
}
