import 'package:flutter/material.dart';

class CreatePollName extends StatefulWidget {
  final TextEditingController controller;

  const CreatePollName({super.key, required this.controller});

  @override
  CreatePollNameState createState() => CreatePollNameState();
}

class CreatePollNameState extends State<CreatePollName> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Commençons par l'essentiel",
          style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8),
      Text(
          "Un titre précis c'est le meilleur moyen pour que vos amis comprennent de quoi il s'agit.",
          style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 40),
      TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: "Quel est le titre de votre sondage ?",
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ce champ est requis";
          }
          return null;
        },
      ),
    ]);
  }
}
