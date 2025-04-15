import 'package:ceticy/providers/friend_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePollFriends extends StatefulWidget {
  final List<int> controller;
  final Function(List<int>) onFriendsUpdated;

  const CreatePollFriends(
      {super.key, required this.controller, required this.onFriendsUpdated});

  @override
  CreatePollFriendsState createState() => CreatePollFriendsState();
}

class CreatePollFriendsState extends State<CreatePollFriends> {
  late List<int> friendsArray;
  late bool submitIsEmpty = false;

  @override
  void initState() {
    super.initState();
    friendsArray = widget.controller;
  }

  @override
  void didUpdateWidget(covariant CreatePollFriends oldWidget) {
    super.didUpdateWidget(oldWidget);
    final pollProvider = Provider.of<FriendProvider>(context, listen: false);
    if (pollProvider.friends.isNotEmpty && widget.controller.isEmpty) {
      setState(() {
        submitIsEmpty = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pollProvider = Provider.of<FriendProvider>(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Choix des contacts", style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8),
      Text(
          "Sélectionnez tous les amis avec qui vous souhaitez partager ce moment.",
          style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 40),
      if (pollProvider.friends.isEmpty)
        const Text("Vous n'avez pas encore d'amis"),
      ListView.builder(
        shrinkWrap: true,
        itemCount: pollProvider.friends.length,
        itemBuilder: (context, index) {
          final friend = pollProvider.friends[index];
          bool isSelected = friendsArray.contains(friend.id);

          return ListTile(
            leading: SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.onSurface,
                )),
            title: Text(friend.email),
            trailing: isSelected
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            tileColor:
                isSelected ? Theme.of(context).colorScheme.surface : null,
            onTap: () {
              setState(() {
                if (isSelected) {
                  friendsArray.remove(friend.id);
                } else {
                  friendsArray.add(friend.id);
                }
                submitIsEmpty =
                    pollProvider.friends.isNotEmpty && friendsArray.isEmpty;
              });
              widget.onFriendsUpdated(friendsArray);
            },
          );
        },
      ),
      if (submitIsEmpty)
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            "Vous devez sélectionner au moins un ami",
            style: TextStyle(color: Colors.red),
          ),
        ),
    ]);
  }
}
