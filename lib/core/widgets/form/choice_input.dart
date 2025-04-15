import 'package:flutter/material.dart';

class ChoiceInput extends StatelessWidget {
  final String label;
  final int selectedValue;
  final int value;
  final ValueChanged<int> onChanged;

  const ChoiceInput({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.value,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        backgroundColor:  selectedValue == value ? Theme.of(context).colorScheme.surface : Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: selectedValue == value ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.secondary,
            width: selectedValue == value ? 2 :1,
          ),
        ),
        elevation: 0
      ),
      onPressed: () => onChanged(value),
      child: Text(label),
    );
  }
  }
