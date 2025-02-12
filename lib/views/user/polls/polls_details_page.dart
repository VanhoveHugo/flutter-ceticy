import 'package:ceticy/models/poll_model.dart';
import 'package:ceticy/providers/poll_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PollsDetailsPage extends StatelessWidget {
  final Poll poll;

  const PollsDetailsPage({super.key, required this.poll});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(poll.name),
       actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert),
            offset: const Offset(0, 50),
            onSelected: (value) {
              // Pas besoin de mettre la logique ici, on la gère dans le Consumer
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.delete,
                        color: Theme.of(context).colorScheme.error),
                    const SizedBox(width: 8),
                    Text("Supprimer"),
                  ],
                ),
                onTap: () {
                  Future.delayed(Duration.zero, () {
                    // Pour éviter un bug avec le menu qui se ferme
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Supprimer le poll"),
                        content:
                            Text("Voulez-vous vraiment supprimer ce poll ?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Annuler"),
                          ),
                          Consumer<PollProvider>(
                            builder: (context, pollProvider, child) {
                              return TextButton(
                                onPressed: () {
                                  pollProvider.deletePoll(context, poll.id);
                                  Navigator.pop(
                                      context); // Fermer la popin après suppression
                                },
                                child: Text("Supprimer",
                                    style: TextStyle(color: Colors.red)),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              "X",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Time-Circle.svg',
                  width: 20,
                  height: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 5),
                Text(
                  "X",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Card.svg',
                  width: 24,
                  height: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 5),
                Text(
                  "X",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // ImageDisplayer(restaurant: poll),
          ],
        ),
      ),
    );
  }
}
