import 'package:flutter/material.dart';

class ChoiceInput extends StatelessWidget {
  final String label;
  final int selectedValue;
  final int value;
  final ValueChanged<int> onChanged;

  const ChoiceInput({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: selectedValue == value ? 2 : 1,
          ),
        ),
      ),
      onPressed: () => onChanged(value),
      child: Text(label),
    );
  }
  }
