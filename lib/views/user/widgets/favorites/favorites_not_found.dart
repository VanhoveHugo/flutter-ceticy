import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/views/navigation/user_navigation.dart';
import 'package:flutter/material.dart';

class FavoritesNotFound extends StatelessWidget {
  const FavoritesNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Allez plus vite dans vos recherches!",
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            "Ici vous pouvez retrouver et organiser vos restaurants favoris en un clic.",
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            onPressed: () {
              NavigationController.changeIndex(1);
            },
            label: "Découvrir des restaurants",
          ),
        ],
      ),
    );
  }
}
