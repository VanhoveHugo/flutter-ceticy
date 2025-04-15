import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  final String name;
  final Function function;
  final IconData? icon;

  const SettingsListTile(
      {super.key, required this.name, required this.function, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(),
        child: ListTile(
          title: Row(
            children: [
              if (icon != null)
                Icon(icon, color: Theme.of(context).colorScheme.onSurface),
              if (icon != null) const SizedBox(width: 16),
              Flexible(
                child: Text(name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        overflow: TextOverflow.ellipsis)),
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          tileColor: Theme.of(context).colorScheme.surface,
          onTap: () {
            function();
          },
        ));
  }
}
