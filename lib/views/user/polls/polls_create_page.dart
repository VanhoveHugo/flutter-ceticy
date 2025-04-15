import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/poll_provider.dart';
import 'package:ceticy/views/user/polls/create/polls_create_date.dart';
import 'package:ceticy/views/user/polls/create/polls_create_friends.dart';
import 'package:ceticy/views/user/polls/create/polls_create_name.dart';
import 'package:ceticy/views/user/polls/create/polls_create_preview.dart';
import 'package:ceticy/views/user/polls/create/polls_create_restaurants.dart';
import 'package:ceticy/views/user/widgets/form/form_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePollPage extends StatefulWidget {
  const CreatePollPage({super.key});

  @override
  CreatePollPageState createState() => CreatePollPageState();
}

class CreatePollPageState extends State<CreatePollPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  List<int> selectedFriends = [];
  bool selectedFriendsIsEmpty = false;
  Restaurant? selectedRestaurant;

  String selectedRestaurantError = '';

  int _currentStep = 0;
  final int _totalSteps = 5;

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  // void _previousStep() {
  //   if (_currentStep > 0) {
  //     setState(() {
  //       _currentStep--;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentStep + 1) / _totalSteps;
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: 'Nouveaux sondage'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormStepper(progress: progress),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              if (_currentStep == 0)
                                CreatePollName(controller: _nameController),
                              if (_currentStep == 1)
                                CreatePollFriends(
                                  controller: selectedFriends,
                                  onFriendsUpdated: (updatedFriends) {
                                    setState(() {
                                      selectedFriends = updatedFriends;
                                    });
                                  },
                                ),
                              if (_currentStep == 2)
                                CreatePollRestaurants(
                                  controller: selectedRestaurant,
                                  onFriendsUpdated: (updatedFriends) {
                                    setState(() {
                                      selectedRestaurant = updatedFriends;
                                    });
                                  },
                                ),
                              if (_currentStep == 3)
                                CreatePollDate(
                                  dateController: _dateController,
                                  timeController: _timeController,
                                ),
                              if (_currentStep == 4)
                                CreatePollPreview(
                                  nameController: _nameController,
                                  dateController: _dateController,
                                  timeController: _timeController,
                                  restaurantName: selectedRestaurant!.name,
                                  friendCount: selectedFriends.length,
                                ),
                            ],
                          )),
                      const SizedBox(height: 48),
                      PrimaryButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          
                          if (_currentStep == 2 && selectedRestaurant == null) {
                            return setState(() {
                              selectedFriendsIsEmpty = true;
                            });
                          }
                          if (_currentStep == 4) {
                            PollProvider pollProvider =
                                Provider.of<PollProvider>(context,
                                    listen: false);
                            pollProvider.createPoll(
                              context,
                              _nameController.text,
                              selectedFriends,
                              selectedRestaurant!.id,
                              // date: _dateController.text,
                            );
                          }
                          _nextStep();
                        },
                        label: 'Continuer',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
