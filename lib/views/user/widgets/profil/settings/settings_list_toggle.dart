import 'package:flutter/material.dart';

class SettingsListToggle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isEnabled;
  final Function(bool) onChanged;

  const SettingsListToggle({
    super.key,
    required this.title,
    required this.isEnabled,
    required this.onChanged,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 20,
                        ),
                  ),
                ],
              )),
              Switch(
                value: isEnabled,
                onChanged: onChanged,
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}
