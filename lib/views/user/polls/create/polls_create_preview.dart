import 'package:flutter/material.dart';

class CreatePollPreview extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final String restaurantName;
  final int friendCount;

  const CreatePollPreview(
      {super.key,
      required this.nameController,
      required this.timeController,
      required this.dateController,
      required this.restaurantName,
      required this.friendCount});

  @override
  CreatePollPreviewState createState() => CreatePollPreviewState();
}

class CreatePollPreviewState extends State<CreatePollPreview> {
  late TextEditingController _nameController;
  late TextEditingController _dateController;
  late TextEditingController _timeController;
  late String _restaurantName;
  late int _friendCount;

  @override
  void initState() {
    super.initState();
    _nameController = widget.nameController;
    _dateController = widget.dateController;
    _timeController = widget.timeController;
    _restaurantName = widget.restaurantName;
    _friendCount = widget.friendCount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Aperçu du sondage", style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 32),
      TextFormField(
        controller: _nameController,
        readOnly: true,
        decoration: const InputDecoration(
          labelText: "Nom du sondage",
        ),
      ),
      const SizedBox(height: 32),
      TextFormField(
        controller: TextEditingController(text: _restaurantName),
        readOnly: true,
        decoration: InputDecoration(
          labelText: "Restaurant",
        ),
      ),
      const SizedBox(height: 32),
      Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Date",
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: _timeController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Heure",
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 32),
      Text("Participants: $_friendCount",
          style: Theme.of(context).textTheme.bodyMedium),
    ]);
  }
}
