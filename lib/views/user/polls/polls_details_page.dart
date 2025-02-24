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
    int pollId = poll.options[0].restaurantId;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    bool? vote;

    String token = authProvider.token!;

    Future<Restaurant> restaurant =
        RestaurantService.fetchRestaurantById(token, pollId);

    return Scaffold(
      appBar: AppBar(
        title: Text(poll.name),
        actions: [
          authProvider.userId == poll.creatorId
              ? PopupMenuButton<int>(
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
                        Future.delayed(Duration.zero, () {
                          if (!context.mounted) {
                            return;
                          }
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Supprimer le poll"),
                              content: Text(
                                  "Voulez-vous vraiment supprimer ce poll ?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Annuler"),
                                ),
                                Consumer<PollProvider>(
                                  builder: (context, pollProvider, child) {
                                    return TextButton(
                                      onPressed: () {
                                        pollProvider.deletePoll(
                                            context, poll.id);

                                        Navigator.pop(context);
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
                )
              : const SizedBox(),
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
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
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
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Restaurant",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                }

                return CircularProgressIndicator();
              },
              future: restaurant,
            ),
            Text(
              'Votes',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 44,
              child: Stack(
                alignment: Alignment.center, // Centre les images
                children: poll.participants.asMap().entries.map((entry) {
                  int index = entry.key;

                  return Positioned(
                    left: index * 30.0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(AppAsset.placeholder),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            YesNo(vote: vote),

            // Text(
            //   'Choix de la date',
            //   style: Theme.of(context).textTheme.titleMedium,
            //   textAlign: TextAlign.left,
            // ),

            // make button Oui / non with checkbox inrow
            const SizedBox(height: 16),
            PrimaryButton(label: "Voter", onPressed: () {
            }),
            ],
          ),
      ),
    );
  }
}
