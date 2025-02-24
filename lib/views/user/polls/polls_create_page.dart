import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/core/widgets/image_displayer.dart';
import 'package:ceticy/core/widgets/modals/bottom_native_modal.dart';
import 'package:ceticy/core/widgets/modals/friend_list.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:ceticy/services/friend_service.dart';
import 'package:flutter/material.dart';
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
  late Future friends;
  late List<int> friendsArray = [];
  String friendsArrayError = '';
  Restaurant? selectedRestaurant;
  String selectedRestaurantError = '';

  Future<List<dynamic>> fetchFriends() async {
    try {
      final response = FriendService.fetchAllFriends(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJ0ZXN0QGV4YW1wbGUuY29tIiwic2NvcGUiOiJ1c2VyIiwiaWF0IjoxNzM5MTE4MDc2fQ.01FgsHsJBqZuacr3s1_kTtvMmjzNe2h9gdEuds0tWwI");

      return response;
    } catch (e) {
      return [];
    }
  }

  void toggleFriendSelection(dynamic friend) {
    setState(() {
      friend['selected'] = !(friend['selected'] ?? false);

      if (friend['selected']) {
        friendsArray.add(friend['id']);
      } else {
        friendsArray.removeWhere((element) => element == friend['id']);
      }
    });
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
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                labelText: 'Nom du sondage'),
                            validator: (value) =>
                                value!.isEmpty ? 'Ce champ est requis' : null,
                          ),
                          const SizedBox(height: 16),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                friendsArray.isNotEmpty
                                                    ? 'Participants (${friendsArray.length})'
                                                    : 'Participants',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                                textAlign: TextAlign.left,
                                              ),
                                              const SizedBox(width: 8),
                                              const Text(
                                                '*',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (friendsArrayError.isNotEmpty)
                                            Text(
                                              friendsArrayError,
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .onSurface),
                                          shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          openFriendsModal();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                selectedRestaurant != null
                                                    ? selectedRestaurant!.name
                                                    : 'Lieu',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                                textAlign: TextAlign.left,
                                              ),
                                              const SizedBox(width: 8),
                                              const Text(
                                                '*',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (selectedRestaurantError.isNotEmpty)
                                            Text(
                                              selectedRestaurantError,
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .onSurface),
                                          shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          openRestaurantModal();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          // Padding(
                          //     padding: const EdgeInsets.symmetric(vertical: 8),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Row(
                          //               children: [
                          //                 Text(
                          //                   'Dates',
                          //                   style: Theme.of(context)
                          //                       .textTheme
                          //                       .titleLarge,
                          //                   textAlign: TextAlign.left,
                          //                 ),
                          //                 const SizedBox(width: 8),
                          //                 const Text(
                          //                   '*',
                          //                   style: TextStyle(
                          //                     color: Colors.red,
                          //                     fontSize: 16,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             IconButton(
                          //               icon: Icon(Icons.add,
                          //                   color: Theme.of(context)
                          //                       .scaffoldBackgroundColor),
                          //               style: ButtonStyle(
                          //                 backgroundColor:
                          //                     WidgetStateProperty.all<Color>(
                          //                         Theme.of(context)
                          //                             .colorScheme
                          //                             .onSurface),
                          //                 shape: WidgetStateProperty.all<
                          //                     RoundedRectangleBorder>(
                          //                   RoundedRectangleBorder(
                          //                     borderRadius:
                          //                         BorderRadius.circular(8),
                          //                   ),
                          //                 ),
                          //               ),
                          //               onPressed: () {
                          //                 openDateModal();
                          //               },
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     )),
                          const SizedBox(height: 16),
                          PrimaryButton(
                            onPressed: () {
                              friendsArrayError = '';
                              selectedRestaurantError = '';

                              if (!_formKey.currentState!.validate()) return;

                              if (friendsArray.isEmpty) {
                                setState(() {
                                  friendsArrayError = "Veuillez sélectionner des amis";
                                });
                                return;
                              }

                              if (selectedRestaurant == null) {
                                setState(() {
                                  selectedRestaurantError = "Veuillez sélectionner un restaurant";
                                });

                                return;
                              }

                              pollProvider.createPoll(context,
                                  _nameController.text.trim(), friendsArray, selectedRestaurant!.id);
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
                          .withValues(alpha: 0.2),
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

  void openFriendsModal() async {
    // Ouvre la modal et attend la fermeture
    await showModalBottomSheet<List<int>>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BottomNativeModal(
          content: Column(
            children: [
              FriendsList(
                friendsFuture: fetchFriends(),
                selectedFriends: friendsArray,
                onFriendsSelected: (selected) {
                  setState(() {
                    friendsArray = selected;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void openDateModal() async {
    // Ouvre la modal et attend la fermeture
    await showModalBottomSheet<List<int>>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BottomNativeModal(
          content: Column(
            children: [
              FormField(
                builder: (FormFieldState state) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Date',
                          ),
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025, 12, 31),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Heure',
                          ),
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void openRestaurantModal() async {
    final restaurantProvider =
        Provider.of<RestaurantProvider>(context, listen: false);
    final likedRestaurants = restaurantProvider.likedRestaurants;

    // Ouvre la modal et attend la fermeture
    List<Restaurant>? setSelectedRestaurant;
    setSelectedRestaurant = await showModalBottomSheet<List<Restaurant>>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BottomNativeModal(
          content: SingleChildScrollView(
            child: Column(
              children: [
                for (var restaurant in likedRestaurants)
                  ListTile(
                    leading: SizedBox(
                      width: 70,
                      height: 70,
                      child: ImageDisplayer(restaurant: restaurant),
                    ),
                    title: Text(restaurant.name),
                    onTap: () {
                      Navigator.of(context).pop([restaurant]);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
    if (setSelectedRestaurant != null) {
      setState(() {
        selectedRestaurant = setSelectedRestaurant![0];
      });
    }
  }
}
