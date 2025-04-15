import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/core/widgets/form/yes_no.dart';
import 'package:ceticy/models/poll_model.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:ceticy/providers/poll_provider.dart';
import 'package:ceticy/services/restaurant_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PollsDetailsPage extends StatelessWidget {
  final Poll poll;

  const PollsDetailsPage({super.key, required this.poll});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String token = authProvider.token!;

    // Vérifier si le sondage a des options
    if (poll.options.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(poll.name),
          actions: [
            if (authProvider.userId == poll.creatorId)
              _popupMenu(context)
          ],
        ),
        body: const Center(
          child: Text("Ce sondage n'a pas de restaurant associé"),
        ),
      );
    }

    int pollId = poll.options[0].restaurantId;
    Future<Restaurant> restaurant =
        RestaurantService.fetchRestaurantById(token, pollId);

    return Scaffold(
      appBar: AppBar(
        title: Text(poll.name),
        actions: [
          if (authProvider.userId == poll.creatorId)
            _popupMenu(context)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Erreur: ${snapshot.error}");
                  }

                  if (snapshot.hasData) {
                    Restaurant restaurant = snapshot.data as Restaurant;

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            // Image
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(AppAsset.placeholder),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Text content
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.name,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Restaurant",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
                return CircularProgressIndicator();
              },
              future: restaurant,
            ),
            const SizedBox(height: 16),
            Text(
              'Votes',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.left,
            ),
            if (poll.participants.isEmpty)
              const Text("Aucun vote pour le moment"),
            const SizedBox(height: 16),
            YesNo(initialVote: null),
            const SizedBox(height: 16),
            PrimaryButton(label: "Voter", onPressed: () {}),
          ],
        ),
      ),
    );
  }

  // Popup menu
  Widget _popupMenu(BuildContext context) {
    return PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert),
              offset: const Offset(0, 50),
              onSelected: (value) {},
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
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Supprimer le sondage"),
                        content:
                            Text("Êtes-vous sûr de vouloir continuer ?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Annuler"),
                          ),
                          TextButton(
                            onPressed: () {
                              PollProvider pollProvider =
                                  Provider.of<PollProvider>(context,
                                      listen: false);
                              pollProvider.deletePoll(context, poll.id);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/home", (route) => false);
                            },
                            child: Text("Supprimer",
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
      ],
    );
  }
}
