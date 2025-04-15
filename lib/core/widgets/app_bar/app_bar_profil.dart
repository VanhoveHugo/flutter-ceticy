import 'package:flutter/material.dart';

class AppBarProfil extends StatelessWidget {
  const AppBarProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("/settings");
          },
        ),
      ],
    );
  }
}
