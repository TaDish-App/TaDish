import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tadish/data_model/restaurant_db.dart';
import '../../../components/roll_button.dart';
import '../../../../components/star_confetti.dart';
import '../../../components/friends_list_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:async';
import '../../../data_model/user_db.dart';

class SurpriseBodyView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = restaurantDB.getRestaurantNames();
    final UserDB userDB = ref.watch(userDBProvider);
    final UserData currentUser = userDB.getUser(currentUserID);
    List<UserData?> friendsList =userDB.getFriends(currentUserID);

    final alternatingColors = [
      Colors.lightBlue,
      Colors.red,
      Colors.lightGreen,
      Colors.yellow
    ];

    StreamController<int> selected = useStreamController<int>();

    final selectedIndex = useStream(selected.stream, initialData: 0).data ?? 0;
    final isAnimating = useState(false);
    final showFriends = useState(false);

    // A function to show the results popup
    void showResultsPopup(String result) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Results'),
            content: Text('The wheel stopped at $result!'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const StarConfetti(),
            ],
          );
        },
      );
    }

    // A function to show the results popup
    void showFriendsListPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Row(
              children: [
                Text('FriendsList'),
                Icon(Icons.emoji_people),
                Text('1'),
              ],
            ),
            content: SingleChildScrollView(
                child: Container(
                    width: 400,
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
                                      FriendsListRow(name: friend!.name, tastePreference: friend.tastePreference,  icon: const Icon(Icons.add_outlined)),
                                  ).toList(),
                                )
                            ),
                          ],
                        )
                      ],
                    )
                )
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void handleRoll() {
      final result = roll(items.length);
      selected.add(result);

      // Show the results popup when the wheel stops
      Future.delayed(const Duration(seconds: 3), () {
        showResultsPopup(items[result]);
        isAnimating.value = false;
      });
    }

    return Stack(children: [
      Positioned.fill(
        child: Image.asset(
          'assets/images/background.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Text(
                'Spin the Wheel',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  showFriends.value = true;
                  showFriendsListPopup();
                },
                child: const Text('FriendsList'),
              ),
              const SizedBox(height: 8),
              RollButtonWithPreview(
                selected: selectedIndex,
                items: items,
                onPressed: isAnimating.value ? null : handleRoll,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: FortuneWheel(
                  selected: selected.stream,
                  // Use the same stream here
                  onAnimationStart: () => isAnimating.value = true,
                  onAnimationEnd: () => isAnimating.value = false,
                  onFling: handleRoll,
                  animateFirst: false,
                  duration: const Duration(seconds: 3),
                  items: [
                    for (var i = 0; i < items.length; i++)
                      FortuneItem(
                        child: Text(items[i],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        onTap: () => print(items[i]),
                        style: FortuneItemStyle(
                          color:
                          alternatingColors[i % alternatingColors.length],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    ]);
  }
}