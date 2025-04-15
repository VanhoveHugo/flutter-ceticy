import 'package:flutter/material.dart';

class BorderTile extends StatelessWidget {
  final String name;
  final Function function;
  final IconData? icon;

  const BorderTile(
      {super.key, required this.name, required this.function, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        child: ListTile(
          title: Row(
            children: [
              if (icon != null)
                Icon(icon, color: Theme.of(context).colorScheme.onSurface),
              if (icon != null) const SizedBox(width: 16),
              Text(name,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 16),
          onTap: () {
            function();
          },
        ));
  }
}
