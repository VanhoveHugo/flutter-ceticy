import 'dart:convert';
import 'dart:io';

import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/services/friend_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/providers/poll_provider.dart';

class CreatePollPage extends StatefulWidget {
  const CreatePollPage({super.key});

  @override
  CreatePollPageState createState() => CreatePollPageState();
}

class CreatePollPageState extends State<CreatePollPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  var friends;

  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  initState() {
    super.initState();
    friends = FriendService.fetchAllPolls(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJ0ZXN0QGV4YW1wbGUuY29tIiwic2NvcGUiOiJ1c2VyIiwiaWF0IjoxNzM5MTE4MDc2fQ.01FgsHsJBqZuacr3s1_kTtvMmjzNe2h9gdEuds0tWwI");
    // print le type of friends
    print(friends.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft, // Aligne à gauche
            child: Text("Nouveau sondage"),
          ),
        ),
        body: SafeArea(
          child: Consumer<PollProvider>(
            builder: (context, pollProvider, child) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: _pickImage,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                  ),
                                  child: _selectedImage == null
                                      ? Icon(
                                          Icons.camera_alt_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: FileImage(_selectedImage!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                      labelText: 'Nom du sondage'),
                                  validator: (value) => value!.isEmpty
                                      ? 'Ce champ est requis'
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Participants',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(height: 16),
                                  FutureBuilder(
                                    future: friends,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator(); // Affiche un loader en attendant
                                      } else if (snapshot.hasError) {
                                        return Text(
                                            'Erreur: ${snapshot.error}'); // Gère les erreurs
                                      } else if (!snapshot.hasData) {
                                        return Text('Aucun ami trouvé');
                                      }
                                      final List<dynamic> friendList =
                                          snapshot.data as List<dynamic>;
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: friendList.length,
                                        itemBuilder: (context, index) {
                                          final friend = friendList[index];

                                          return ListTile(
                                            title: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  friend['selected'] =
                                                      !(friend['selected'] ??
                                                          false);
                                                });
                                              },
                                              child: Text(
                                                friend['email'],
                                                style: TextStyle(
                                                  color: (friend['selected'] ??
                                                          false)
                                                      ? Colors.red
                                                      : Colors
                                                          .black, // Change la couleur selon l'état
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                    },
                                  ),
                                ],
                              )),
                          const SizedBox(height: 20),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Les dates',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        textAlign: TextAlign.left,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/polls');
                                        },
                                        child: Text(
                                          'Ajouter',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Vide",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              )),
                          const SizedBox(height: 20),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Les lieux',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        textAlign: TextAlign.left,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/polls');
                                        },
                                        child: Text(
                                          'Ajouter',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Vide",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              )),
                          const SizedBox(height: 20),
                          PrimaryButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) return;
                              pollProvider.createPoll(
                                  context, _nameController.text.trim());
                            },
                            label: "Créer le sondage",
                          ),
                          if (pollProvider.errorMessage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                pollProvider.errorMessage,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (pollProvider.isLoading)
                    Container(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.2),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              );
            },
          ),
        ));
  }
}
