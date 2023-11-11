import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:tadish/features/picker/domain/restaurant.dart';
import 'package:tadish/features/picker/domain/restaurant_collection.dart';
import 'roll_button.dart';
import '../../common/star_confetti.dart';
import '../../user/presentation/friends_list_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:async';
import '../../user/domain/user_db.dart';

import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import '../data/restaurant_database.dart';
import '../data/restaurant_provider.dart';
import '../domain/restaurant.dart';

class SurpriseBodyView extends ConsumerStatefulWidget {
  const SurpriseBodyView({
    super.key,
  });

  @override
  ConsumerState<SurpriseBodyView> createState() => _SurpriseBodyViewState();
}

class _SurpriseBodyViewState extends ConsumerState<SurpriseBodyView> {

  final alternatingColors = [
    Colors.lightBlue,
    Colors.red,
    Colors.lightGreen,
    Colors.yellow
  ];

  StreamController<int> selected = StreamController<int>();

  int selectedIndex = 0;
  bool isAnimating = false;
  bool showFriends = false;

  @override
  void initState() {
    super.initState();
    selected = StreamController<int>();
    selectedIndex = 0;
    isAnimating = false;
    showFriends = false;
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

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
  
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Restaurant>> asyncRestaurantsDB = ref.watch(restaurantsProvider);
    return asyncRestaurantsDB.when(data: (restaurants) {
      print("data");
      return _build(context: context, restaurants: restaurants, ref: ref);
    }, loading: () {
      print("loading");
      return const TadishLoading();
    }, error: (error, stacktrace) {
      print("error");
      print(error.toString());
      return TadishError(error.toString(), stacktrace.toString());
    });
  }
  
  Widget _build(
    {required BuildContext context,
      required List<Restaurant> restaurants,
      required WidgetRef ref}) {

    RestaurantCollection restaurantCollection = RestaurantCollection(restaurants);
    final items = restaurantCollection.getRestaurantNames();
    final String currentUserID = ref.watch(currentUserIDProvider);
    final UserDB userDB = ref.watch(userDBProvider);
    final UserData currentUser = userDB.getUser(currentUserID);
    List<UserData?> friendsList =userDB.getFriends(currentUserID);

    // A function to show the friends list popup
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
                      FriendsListRow(
                          name: currentUser.name,
                          tastePreference: currentUser.tastePreference,
                          icon: const Icon(Icons.person)),
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
                              children: friendsList
                                  .map((friend) => FriendsListRow(
                                  name: friend!.name,
                                  tastePreference: friend.tastePreference,
                                  icon: const Icon(Icons.add_outlined)))
                                  .toList(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
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
        setState(() {
          isAnimating = false;
        });
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
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showFriends = true;
                  });
                  showFriendsListPopup();
                },
                child: const Text('FriendsList'),
              ),
              const SizedBox(height: 8),
              RollButtonWithPreview(
                selected: selectedIndex,
                items: items,
                onPressed: isAnimating ? null : handleRoll,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: FortuneWheel(
                  selected: selected.stream,
                  // Use the same stream here
                  onAnimationStart: () {
                    setState(() {
                      isAnimating = true;
                    });
                  },
                  onAnimationEnd: () {
                    setState(() {
                      isAnimating = false;
                    });
                  },
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
                          color: alternatingColors[i % alternatingColors.length],
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
