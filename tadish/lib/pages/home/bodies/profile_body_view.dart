import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tadish/data_model/rating_db.dart';
import '../../../components/history_view.dart';
import '../../../components/taste_prefs_radar_chart.dart';
import '../../../custom_theme.dart';

import '../../../components/Tile.dart';
import '../../../data_model/user_db.dart';

class ProfileBodyView extends StatefulWidget {
  const ProfileBodyView({
    super.key,
  });

  @override
  State<ProfileBodyView> createState() => _ProfileBodyViewState();
}

class _ProfileBodyViewState extends State<ProfileBodyView> {
  static Color activeIcon = customPrimarySwatch.withOpacity(0.9);
  static Color inactiveIcon = customPrimarySwatch.withOpacity(0.5);
  static Color activeUnderline = customPrimarySwatch.withOpacity(0.15);
  static Color inactiveUnderline = Colors.transparent;
  Color favoriteIconColor = activeIcon;
  Color favoriteUnderline = activeUnderline;
  Color historyIconColor = inactiveIcon;
  Color historyUnderline = inactiveUnderline;

  bool onFavorites = true;

  @override
  Widget build(BuildContext context) {
    const secondaryTextColor = Colors.grey;
    UserData currentUser = UserDB().getUser(currentUserID);

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
                    Text(usersDB.getFriends(currentUserID).length.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    const Text("Friends",
                        style: TextStyle(color: secondaryTextColor)),
                  ],
                ),
                Column(
                  children: [
                    Text(usersDB.getUser(currentUserID).taggedDishes.toString(),
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
                      setState(() {
                        if (favoriteUnderline == inactiveUnderline) {
                          favoriteUnderline = activeUnderline;
                          favoriteIconColor = activeIcon;
                          historyIconColor = inactiveIcon;
                          historyUnderline = inactiveUnderline;
                        }
                        onFavorites = !onFavorites;
                      });
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
                        // TODO Change to history view
                        setState(() {
                          if (historyUnderline == inactiveUnderline) {
                            favoriteUnderline = inactiveUnderline;
                            favoriteIconColor = inactiveIcon;
                            historyIconColor = activeIcon;
                            historyUnderline = activeUnderline;
                          }
                          onFavorites = !onFavorites;
                        });
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
                ? Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          children: const [
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: Tile(index: 0),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1,
                              child: Tile(index: 1),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: Tile(index: 2),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: Tile(index: 3),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          children: const [
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: Tile(index: 4),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1,
                              child: Tile(index: 5),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: Tile(index: 6),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: Tile(index: 7),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: HistoryView(userID: currentUserID))), // TODO dynamically change userid
          ],
        ),
      ),
    );
  }
}

