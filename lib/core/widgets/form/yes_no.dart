import 'package:flutter/material.dart';

class YesNo extends StatefulWidget {
  final bool? initialVote;

  const YesNo({super.key, required this.initialVote});

  @override
  YesNoState createState() => YesNoState();
}

class YesNoState extends State<YesNo> {
  bool? vote;

  @override
  void initState() {
    super.initState();
    vote = widget.initialVote;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: const Text("Oui", textAlign: TextAlign.start),
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            leading: Radio<bool>(
              value: true,
              groupValue: vote,
              onChanged: (value) {
                setState(() {
                  vote = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              setState(() {
                vote = true;
              });
            },
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text("Non", textAlign: TextAlign.end),
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            trailing: Radio<bool>(
              value: false,
              groupValue: vote,
              onChanged: (value) {
                setState(() {
                  vote = value;
                });
              },
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              setState(() {
                vote = false;
              });
            },
          ),
        ),
      ],
    );
  }
}
