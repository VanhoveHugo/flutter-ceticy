import 'package:flutter/material.dart';

class YesNo extends StatefulWidget {
  bool? vote;

  YesNo({super.key, required this.vote});

  @override
  YesNoState createState() => YesNoState();
}

class YesNoState extends State<YesNo> {

  @override
  Widget build(BuildContext context) {
    return  Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    value: widget.vote == true, // Coche uniquement si vote est true
                    onChanged: (value) {
                      setState(() {
                        widget.vote = true;
                      });
                    },
                    title: Text("Oui"),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    value: widget.vote == false, // Coche uniquement si vote est false
                    onChanged: (value) {
                      setState(() {
                        widget.vote = false
                            ; // Toggle entre null et false
                      });
                    },
                    title: Text("Non", textAlign: TextAlign.end),
                  ),
                ),
              ],
            );
  }
}
