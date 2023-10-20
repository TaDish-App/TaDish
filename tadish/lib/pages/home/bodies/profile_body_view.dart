import 'package:flutter/material.dart';
import 'package:tadish/components/favorites_view.dart';
import 'package:tadish/data_model/rating_db.dart';
import '../../../components/history_view.dart';
import '../../../components/taste_prefs_radar_chart.dart';
import '../../../custom_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data_model/user_db.dart';

class ProfileBodyView extends ConsumerWidget {
  static Color activeIcon = customPrimarySwatch.withOpacity(0.9);
  static Color inactiveIcon = customPrimarySwatch.withOpacity(0.5);
  static Color activeUnderline = customPrimarySwatch.withOpacity(0.15);
  static Color inactiveUnderline = Colors.transparent;

  const ProfileBodyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color favoriteIconColor = ref.watch(favoriteIconColorProvider);
    final Color favoriteUnderline = ref.watch(favoriteUnderlineProvider);
    final Color historyIconColor = ref.watch(historyIconColorProvider);
    final Color historyUnderline = ref.watch(historyUnderlineProvider);
    final bool onFavorites = ref.watch(onFavoritesProvider);

    const secondaryTextColor = Colors.grey;
    final UserDB userDB = ref.watch(userDBProvider);
    final UserData currentUser = userDB.getUser(currentUserID);

    return Center(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Radar Chart for taste prefs
            TastePrefsRadarChart(
              tastePrefsData: currentUser.tastePreference,
              radius: 40,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              currentUser.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, color: secondaryTextColor),
                Text("${currentUser.username}  | ",
                    style: const TextStyle(color: secondaryTextColor)),
                const Icon(
                  Icons.pin_drop_rounded,
                  color: secondaryTextColor,
                ),
                Text(" ${currentUser.geolocation}",
                    style: const TextStyle(color: secondaryTextColor)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(ratingsDB.getSingularUserRatings(currentUserID).length.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    const Text("Ratings", style: TextStyle(color: secondaryTextColor)),
                  ],
                ),
                Column(
                  children: [
                    Text(userDB.getFriends(currentUserID).length.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    const Text("Friends",
                        style: TextStyle(color: secondaryTextColor)),
                  ],
                ),
                Column(
                  children: [
                    Text(userDB.getUser(currentUserID).taggedDishes.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    const Text("Special",
                        style: TextStyle(color: secondaryTextColor)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: favoriteUnderline),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // TODO Change to favorites view if not in favorite view already
                      if (favoriteUnderline == inactiveUnderline) {
                      ref.read(favoriteUnderlineProvider.notifier).state = activeUnderline;
                      ref.read(favoriteIconColorProvider.notifier).state = activeIcon;
                      ref.read(historyIconColorProvider.notifier).state = inactiveIcon;
                      ref.read(historyUnderlineProvider.notifier).state = inactiveUnderline;
                      }
                      ref.read(onFavoritesProvider.notifier).state = !onFavorites;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Icon(Icons.favorite, color: favoriteIconColor),
                  ),
                )),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: historyUnderline),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (favoriteUnderline == inactiveUnderline) {
                          ref.read(favoriteUnderlineProvider.notifier).state = inactiveUnderline;
                          ref.read(favoriteIconColorProvider.notifier).state = inactiveIcon;
                          ref.read(historyIconColorProvider.notifier).state = activeIcon;
                          ref.read(historyUnderlineProvider.notifier).state = activeUnderline;
                        }
                        ref.read(onFavoritesProvider.notifier).state = !onFavorites;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Icon(Icons.history_edu, color: historyIconColor),
                    ),
                  ),
                )
              ],
            ),
            (onFavorites
                ? const Expanded(
                    child: FavoritesView(),
                  )
                : Expanded(
                    child: HistoryView(userID: currentUserID))), // TODO dynamically change userid
          ],
        ),
      ),
    );
  }
}

