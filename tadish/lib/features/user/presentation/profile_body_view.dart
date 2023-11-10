import 'package:flutter/material.dart';
import 'package:tadish/features/user/presentation/favorites_view.dart';
import 'package:tadish/features/ratings/domain/rating.dart';
import 'history_view.dart';
import '../../common/taste_prefs_radar_chart.dart';
import '../../../custom_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user_db.dart';

class ProfileBodyView extends ConsumerStatefulWidget {
  const ProfileBodyView({
    super.key,
  });

  @override
  ConsumerState<ProfileBodyView> createState() => _ProfileBodyViewState();
}

class _ProfileBodyViewState extends ConsumerState<ProfileBodyView> {
  bool onFavorites = true;

  @override
  Widget build(BuildContext context) {
    final ratingsDB = ref.watch(ratingsDBProvider);

    const secondaryTextColor = Colors.grey;
    final String currentUserID = ref.watch(currentUserIDProvider);
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
                    Text(
                        ratingsDB
                            .getSingularUserRatings(currentUserID)
                            .length
                            .toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    const Text("Ratings",
                        style: TextStyle(color: secondaryTextColor)),
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
                      bottom: BorderSide(
                          width: 1.0,
                          color: onFavorites
                              ? customPrimarySwatch.withOpacity(0.15)
                              : Colors.transparent),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (!onFavorites) {
                        setState(() {
                          onFavorites = !onFavorites;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Icon(Icons.favorite,
                        color: onFavorites
                            ? customPrimarySwatch.withOpacity(0.9)
                            : customPrimarySwatch.withOpacity(0.5)),
                  ),
                )),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: !onFavorites
                                ? customPrimarySwatch.withOpacity(0.15)
                                : Colors.transparent),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (onFavorites) {
                          setState(() {
                            onFavorites = !onFavorites;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Icon(Icons.history_edu,
                          color: !onFavorites
                              ? customPrimarySwatch.withOpacity(0.9)
                              : customPrimarySwatch.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            ),
            (onFavorites
                ? const Expanded(
                    child: FavoritesView(),
                  )
                : Expanded(child: HistoryView(userID: currentUserID))),
          ],
        ),
      ),
    );
  }
}
