import 'package:flutter/material.dart';

class SettingsListRadio extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function(bool) onChanged;

  const SettingsListRadio({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            trailing: Radio<bool>(
              value: true,
              groupValue: isSelected ? true : null,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                }
              },
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              onChanged(true);
            },
          ),
        ],
      ),
    );
  }
}
