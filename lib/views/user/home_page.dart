import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/models/poll_model.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:ceticy/providers/poll_provider.dart';
import 'package:ceticy/views/navigation/user_navigation.dart';
import 'package:ceticy/views/user/polls/polls_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pollProvider = Provider.of<PollProvider>(context);
    final polls = pollProvider.polls;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    print(authProvider.currentLikeCount);

    return SafeArea(
        child: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          authProvider.currentLikeCount == 0 ?
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Découvrez de nouveaux lieux',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Découvrez les lieux les plus populaires autour de vous.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    onPressed: () {
                      NavigationController.changeIndex(1);
                    },
                    label: 'Découvrir',
                  ),
                ],
              ),
            ),
          ) : const SizedBox.shrink(),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sondages',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.left,
                ),
                IconButton(
                  icon: Icon(Icons.add,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onSurface),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/polls/create",
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'En cours',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            polls.length.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          pollProvider.fetchAllPolls();
                        },
                        child: Text(
                          'Rafrachir',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: polls.length,
                      itemBuilder: (context, index) {
                        final Poll poll = polls[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PollsDetailsPage(poll: poll),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              poll.name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
          // Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 8),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Row(
          //               children: [
          //                 Text(
          //                   'À venir',
          //                   style: Theme.of(context).textTheme.titleMedium,
          //                   textAlign: TextAlign.left,
          //                 ),
          //                 const SizedBox(width: 8),
          //                 Text(
          //                   '?',
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .titleMedium
          //                       ?.copyWith(
          //                         color: Colors.grey,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                   textAlign: TextAlign.left,
          //                 ),
          //               ],
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 Navigator.pushNamed(context, '/polls');
          //               },
          //               child: Text(
          //                 'Voir tout',
          //                 style: Theme.of(context).textTheme.bodyMedium,
          //               ),
          //             ),
          //           ],
          //         ),
          //         const SizedBox(height: 16),
          //         Text(
          //           'Découvrez les sondages de vos amis et partagez les vôtres.',
          //           style: Theme.of(context).textTheme.bodyMedium,
          //           textAlign: TextAlign.left,
          //         ),
          //       ],
          //     )),
        ],
      ),
    )));
  }
}
