import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/drawer_view.dart';
import '../domain/user.dart';
import 'friends_list_row.dart';

class FriendsListView extends ConsumerWidget {

  static const routeName = '/friendslist';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentUserID = ref.watch(currentUserIDProvider);
    final UserDB userDB = ref.watch(userDBProvider);
    final UserData currentUser = userDB.getUser(currentUserID);
    final List<UserData?> friendsList = userDB.getFriends(currentUserID);
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Friends List'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              FriendsListRow(name: currentUser.name, tastePreference: currentUser.tastePreference, icon: const Icon(Icons.person)),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Add a friend',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Adding a friend'),
                        ),
                      );
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  friendsList.isEmpty
                      ? Container(
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('No friends'),
                      ],
                    ),
                  )
                      : Container(
                      height: 200,
                      child: ListView(
                        children: friendsList.map((friend) =>
                            FriendsListRow(name: friend!.name, tastePreference: friend.tastePreference,  icon: const Icon(Icons.person_outline)),
                        ).toList(),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

