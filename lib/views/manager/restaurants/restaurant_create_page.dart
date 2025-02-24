import 'dart:io';
import 'dart:typed_data';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/core/widgets/form/choice_input.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RestaurantsCreatePage extends StatefulWidget {
  const RestaurantsCreatePage({super.key});

  @override
  RestaurantsCreatePageState createState() => RestaurantsCreatePageState();
}

class RestaurantsCreatePageState extends State<RestaurantsCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _averagePriceValue = 0;
  bool _isPriceValid = true;

  int _averageServiceValue = 0;
  bool _isServiceValid = true;

  final TextEditingController _phoneNumberController = TextEditingController();

  File? _selectedImage;
  bool _isImageValid = true;
  Uint8List? _webImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes(); // Lire en Uint8List
      setState(() {
        _webImage = bytes;
        _selectedImage = File(pickedFile.path);
        _isImageValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajouter un restaurant'),
        ),
        body: SafeArea(
          child: Consumer<RestaurantProvider>(
            builder: (context, pollProvider, child) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ),
                              child: _selectedImage == null
                                  ? const Center(
                                      child: Text('Sélectionner une image'))
                                  : Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: _webImage != null
                                              ? MemoryImage(_webImage!) as ImageProvider<Object>
                                              : FileImage(_selectedImage!) as ImageProvider<Object>,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          if (!_isImageValid)
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Vous devez sélectionner une image',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                labelText: 'Nom du restaurant'),
                            validator: (value) =>
                                value!.isEmpty ? 'Ce champ est requis' : null,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                                labelText: 'Description du restaurant'),
                            validator: (value) =>
                                value!.isEmpty ? 'Ce champ est requis' : null,
                          ),
                          const SizedBox(height: 20),

                          const Text("Prix moyen par personne"),
                          Row(
                            children: [
                              ChoiceInput(
                                label: '- 15€',
                                value: 1,
                                selectedValue: _averagePriceValue,
                                onChanged: (value) {
                                  setState(() {
                                    _averagePriceValue = value;
                                    _isPriceValid = true;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              ChoiceInput(
                                label: '15€ - 30€',
                                value: 2,
                                selectedValue: _averagePriceValue,
                                onChanged: (value) {
                                  setState(() {
                                    _averagePriceValue = value;
                                    _isPriceValid = true;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              ChoiceInput(
                                label: '+ 30€',
                                value: 3,
                                selectedValue: _averagePriceValue,
                                onChanged: (value) {
                                  setState(() {
                                    _averagePriceValue = value;
                                    _isPriceValid = true;
                                  });
                                },
                              ),
                            ],
                          ),
                          if (!_isPriceValid)
                            const Padding(
                              padding: EdgeInsets.only(top: 4, left: 12),
                              child: Text(
                                'Ce champ est requis',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ),

                          const SizedBox(height: 20),
                          const Text("Temps d'attente moyen"),
                          Row(
                            children: [
                              ChoiceInput(
                                label: '- 30min',
                                value: 1,
                                selectedValue: _averageServiceValue,
                                onChanged: (value) {
                                  setState(() {
                                    _averageServiceValue = value;
                                    _isServiceValid = true;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              ChoiceInput(
                                label: '30min - 1h',
                                value: 2,
                                selectedValue: _averageServiceValue,
                                onChanged: (value) {
                                  setState(() {
                                    _averageServiceValue = value;
                                    _isServiceValid = true;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              ChoiceInput(
                                label: '+ 1h',
                                value: 3,
                                selectedValue: _averageServiceValue,
                                onChanged: (value) {
                                  setState(() {
                                    _averageServiceValue = value;
                                    _isServiceValid = true;
                                  });
                                },
                              ),
                            ],
                          ),
                          if (!_isServiceValid)
                            const Padding(
                              padding: EdgeInsets.only(top: 4, left: 12),
                              child: Text(
                                'Ce champ est requis',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ),

                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration: const InputDecoration(
                                labelText: 'Numéro de téléphone'),
                            validator: (value) =>
                                value!.isEmpty ? 'Ce champ est requis' : null,
                          ),
                          const SizedBox(height: 20),
                          PrimaryButton(
                            onPressed: () {
                              if (_selectedImage == null) {
                                setState(() {
                                  _isImageValid = false;
                                });
                              }

                              if (_averagePriceValue == 0) {
                                setState(() {
                                  _isPriceValid = false;
                                });
                              }

                              if (_averageServiceValue == 0) {
                                setState(() {
                                  _isServiceValid = false;
                                });
                              }

                              if (!_formKey.currentState!.validate() ||
                                  _averagePriceValue == 0 ||
                                  _averageServiceValue == 0 ||
                                  !_isImageValid) {
                                return;
                              }

                              pollProvider.createRestaurant(
                                  context,
                                  _nameController.text.trim(),
                                  _descriptionController.text.trim(),
                                  _averagePriceValue,
                                  _averageServiceValue,
                                  _phoneNumberController.text.trim(),
                                  _selectedImage!);
                            },
                            label: "Créer le restaurant",
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
                          .withValues(alpha: 0.8),
                      child: const Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text(
                              'Le chargement peut prendre quelques secondes...'),
                        ],
                      )),
                    ),
                ],
              );
            },
          ),
        ));
  }
}
