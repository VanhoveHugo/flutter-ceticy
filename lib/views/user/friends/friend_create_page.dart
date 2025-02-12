import 'dart:convert';

import 'package:ceticy/core/app_constants.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class FriendsCreatePage extends StatefulWidget {
  const FriendsCreatePage({Key? key}) : super(key: key);

  @override
  FriendsCreatePageState createState() => FriendsCreatePageState();
}

class FriendsCreatePageState extends State<FriendsCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  final TextEditingController emailController = TextEditingController();

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final auth = Provider.of<AuthProvider>(context, listen: false);

      if (auth.isManager) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vous ne pouvez pas ajouter d\'ami en tant que manager')),
        );
        Navigator.pop(context);
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

      if (request.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Demande d\'ami envoyée')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur : ${request.reasonPhrase}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur : $e')),
      );
    } finally {
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: emailController,
                decoration:
                    const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Ce champ est requis' : null,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                onPressed: _submitForm,
                label: "Ajouter",
              )
            ],
          ),
        ),
      ),
    );
  }
}
