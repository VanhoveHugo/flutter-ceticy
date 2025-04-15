import 'package:flutter/material.dart';

class CreatePollDate extends StatefulWidget {
  final TextEditingController dateController;
  final TextEditingController timeController;

  const CreatePollDate(
      {super.key, required this.dateController, required this.timeController});

  @override
  CreatePollDateState createState() => CreatePollDateState();
}

class CreatePollDateState extends State<CreatePollDate> {
  late TextEditingController _dateController;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _dateController = widget.dateController;
    _timeController = widget.timeController;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Choix de la date", style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8),
      Text(
          "La date est un élément essentiel pour que vos amis puissent s'organiser.",
          style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 40),
      Row(
        children: [
          // 📆 Champ Date (prend 50% de l'écran)
          Expanded(
            child: TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Date",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                _selectDate(context);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ce champ est requis";
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 16), // Espace entre les deux champs

          // ⏰ Champ Heure (prend 50% de l'écran)
          Expanded(
            child: TextFormField(
              controller: _timeController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Heure",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.access_time),
              ),
              onTap: () async {
                _selectTime(context);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ce champ est requis";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    ]);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _timeController.text =
            "${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}";
      });
    }
  }
}
