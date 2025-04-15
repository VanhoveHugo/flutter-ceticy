import 'package:flutter/material.dart';

class FormStepper extends StatelessWidget {
  final double progress;

  const FormStepper({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Stack(
        children: [
          AnimatedContainer(
            height: 3,
            width: MediaQuery.of(context).size.width * progress,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }
}
