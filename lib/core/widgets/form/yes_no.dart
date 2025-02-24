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
          child: CheckboxListTile(
            value: vote == true,
            onChanged: (value) {
              setState(() {
                vote = true;
              });
            },
            title: const Text("Oui"),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        Expanded(
          child: CheckboxListTile(
            value: vote == false,
            onChanged: (value) {
              setState(() {
                vote = false;
              });
            },
            title: const Text("Non", textAlign: TextAlign.end),
          ),
        ),
      ],
    );
  }
}
