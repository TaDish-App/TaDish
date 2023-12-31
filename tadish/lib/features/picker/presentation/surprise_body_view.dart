import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:tadish/features/picker/domain/restaurant.dart';
import 'package:tadish/features/picker/domain/restaurant_collection.dart';
import 'package:tadish/features/user/domain/user_collection.dart';
import 'roll_button.dart';
import '../../common/star_confetti.dart';
import '../../user/presentation/friends_list_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../user_restaurant_data_provider.dart';
import '../../common/taste_prefs_radar_chart.dart';

import 'dart:async';
import '../../user/domain/user.dart';

import '../../tadish_error.dart';
import '../../tadish_loading.dart';

final partyProvider = StateProvider<List<String>>((ref) => []);

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
    final AsyncValue<UserRestaurant> asyncUserRestaurant = ref.watch(userRestaurantProvider);
    return asyncUserRestaurant.when(data: (userRestaurant) {
      return _build(context: context, userID: userRestaurant.currentUserEmail, users: userRestaurant.user, restaurants: userRestaurant.restaurant, ref: ref);
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
      required List<User> users,
      required String userID,
      required WidgetRef ref}) {
    
    RestaurantCollection restaurantCollection = RestaurantCollection(restaurants);
    final items = restaurantCollection.getRestaurantNames();
    final String currentUserID = userID;
    final UserCollection userDB =UserCollection(users);
    final User currentUser = userDB.getUser(currentUserID);
    List<User?> friendsList = userDB.getFriends(currentUserID);
    final List<String> currentParty = ref.watch(partyProvider);

    // A function to show the friends list popup
    void showFriendsListPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Text('FriendsList'),
                Icon(Icons.emoji_people),
                Text('${currentParty.length + 1}'),
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
                          email: currentUser.email,
                          icon: const Icon(Icons.person)),
                      const SizedBox(
                        height: 5,
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
                                  .map((friend) => 
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Radar Chart for taste prefs
                                        TastePrefsRadarChart(tastePrefsData: friend!.tastePreference, radius: 20,),
                                        Text(
                                          friend.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        // Wrap the icon with GestureDetector
                                        GestureDetector(
                                          onTap: () {
                                            // if (currentParty.contains(friend.email)) {
                                            //     ref.read(partyProvider.notifier).state = currentParty.where((email) => email != friend.email).toList();
                                            // } else {
                                            //   ref.read(partyProvider.notifier).state = [...currentParty, friend.email];
                                            // }
                                          },
                                          child: Icon(currentParty.contains(friend.email) ? Icons.do_not_disturb_on_outlined : Icons.add_outlined,),
                                        ),
                                      ],
                                    ),
                                  )
                                  )
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
