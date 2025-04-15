import 'dart:io' as io;
import 'package:ceticy/models/restaurant_model.dart';
import 'package:flutter/foundation.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/core/widgets/form/choice_input.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantsUpdatePage extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantsUpdatePage({super.key, required this.restaurant});

  @override
  RestaurantsUpdatePageState createState() => RestaurantsUpdatePageState();
}

class RestaurantsUpdatePageState extends State<RestaurantsUpdatePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _averagePriceValue = 0;
  bool _isPriceValid = true;

  int _averageServiceValue = 0;
  bool _isServiceValid = true;

  final TextEditingController _phoneNumberController = TextEditingController();

  io.File? _selectedImage;
  bool _isImageValid = true;
  Uint8List? _webImage;

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.restaurant.name;
    _descriptionController.text = widget.restaurant.description;
    _averagePriceValue = widget.restaurant.averagePrice!;
    _averageServiceValue = widget.restaurant.averageService!;
    _phoneNumberController.text = widget.restaurant.phoneNumber!;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Modifier votre restaurant'),
        ),
        body: SafeArea(
          child: Consumer<RestaurantProvider>(
            builder: (context, pollProvider, child) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                labelText: 'Nom du restaurant'),
                            validator: (value) =>
                                value!.isEmpty ? 'Ce champ est requis' : null,
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                                labelText: 'Description du restaurant'),
                            validator: (value) =>
                                value!.isEmpty ? 'Ce champ est requis' : null,
                          ),
                          const SizedBox(height: 24),
                          const Text("Prix moyen par personne"),
                          const SizedBox(height: 8),
                          Wrap(
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
                          const SizedBox(height: 24),
                          const Text("Temps d'attente moyen"),
                          const SizedBox(height: 8),
                          Wrap(
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
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration: const InputDecoration(
                                labelText: 'Numéro de téléphone'),
                            validator: (value) =>
                                value!.isEmpty ? 'Ce champ est requis' : null,
                          ),
                          const SizedBox(height: 24),
                          PrimaryButton(
                            onPressed: () async {
                              if (_selectedImage == null && _webImage == null) {
                                _isImageValid = false;
                              }

                              if (_averagePriceValue == 0) {
                                _isPriceValid = false;
                              }

                              if (_averageServiceValue == 0) {
                                _isServiceValid = false;
                              }

                              if (!_formKey.currentState!.validate() ||
                                  !_isImageValid ||
                                  !_isPriceValid ||
                                  !_isServiceValid) {
                                return setState(() {});
                              }

                              // pollProvider.createRestaurant(
                              //     context,
                              //     _nameController.text.trim(),
                              //     _descriptionController.text.trim(),
                              //     _averagePriceValue,
                              //     _averageServiceValue,
                              //     _phoneNumberController.text.trim());
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
