import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/core/widgets/form/choice_input.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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

  io.File? _selectedImage;
  bool _isImageValid = true;
  Uint8List? _webImage;

  Future<Uint8List> convertMultipartFileToUint8List(
      http.MultipartFile file) async {
    final stream = file.finalize();
    final bytes = await http.ByteStream(stream).toBytes();
    return bytes;
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      // html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      // uploadInput.accept = 'image/*';
      // uploadInput.click();

      // uploadInput.onChange.listen((event) {
      //   final file = uploadInput.files!.first;
      //   final reader = html.FileReader();

      //   reader.readAsArrayBuffer(file);
      //   reader.onLoadEnd.listen((e) {
      //     Uint8List fileBytes = reader.result as Uint8List;

      //     setState(() {
      //       _webImage = fileBytes;
      //       _selectedImage = null;
      //       _isImageValid = true;
      //     });
      //   });
      // });
    } else {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();

        setState(() {
          _webImage = bytes;
          _selectedImage = io.File(pickedFile.path);
          _isImageValid = true;
        });
      }
    }
  }

  Widget _displayImage() {
    if (kIsWeb && _webImage != null) {
      return Image.memory(_webImage!, fit: BoxFit.cover);
    } else if (_selectedImage != null) {
      return Image.file(_selectedImage!, fit: BoxFit.cover);
    } else {
      return const Center(child: Text("Aucune image sélectionnée"));
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
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              height: 136,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Theme.of(context).colorScheme.secondary,
                                )
                              ),
                              child: _displayImage(),
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
                          const SizedBox(height: 24),
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

                              dynamic imageToUpload;
                              if (kIsWeb) {
                                imageToUpload = http.MultipartFile.fromBytes(
                                  'thumbnail',
                                  _webImage!,
                                  filename: 'thumbnail.png',
                                  contentType: MediaType('image', 'png'),
                                );
                                Uint8List imageBytes =
                                    await convertMultipartFileToUint8List(
                                        imageToUpload);
                                imageToUpload = imageBytes;
                              } else {
                                imageToUpload = io.File(_selectedImage!.path);
                              }

                              pollProvider.createRestaurant(
                                  context,
                                  _nameController.text.trim(),
                                  _descriptionController.text.trim(),
                                  _averagePriceValue,
                                  _averageServiceValue,
                                  _phoneNumberController.text.trim(),
                                  imageToUpload);
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
