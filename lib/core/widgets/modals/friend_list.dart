import 'package:flutter/material.dart';

class FriendsList extends StatefulWidget {
  final Future<List<dynamic>> friendsFuture;
  final List<int> selectedFriends;
  final Function(List<int>) onFriendsSelected;

  const FriendsList({
    super.key,
    required this.friendsFuture,
    required this.selectedFriends,
    required this.onFriendsSelected,
  });

  @override
  FriendsListState createState() => FriendsListState();
}

class FriendsListState extends State<FriendsList> {
  late List<int> selectedFriends;

  @override
  void initState() {
    super.initState();
    selectedFriends = List.from(widget.selectedFriends);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: widget.friendsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('Aucun ami trouvé');
        }
        final List<dynamic> friendList = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: friendList.length,
          itemBuilder: (context, index) {
            final friend = friendList[index];
            bool isSelected = selectedFriends
                .contains(friend['id']);

            return ListTile(
              leading: Checkbox(
                value: isSelected,
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedFriends.add(friend['id']);
                    } else {
                      selectedFriends.remove(friend['id']);
                    }
                  });
                  widget.onFriendsSelected(selectedFriends);
                },
              ),

              title: Text(
                friend['email'],
                style: TextStyle(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedFriends
                        .remove(friend['id']);
                  } else {
                    selectedFriends.add(friend['id']);
                  }
                });
                widget.onFriendsSelected(
                    selectedFriends);
              },
            );
          },
        );
      },
    );
  }
}
