import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:radar_chart/radar_chart.dart';
import '../../../custom_theme.dart';

import '../../../components/Tile.dart';

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

  @override
  Widget build(BuildContext context) {


    const secondaryTextColor = Colors.grey;
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Radar Chart for taste prefs
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(
                      side: BorderSide(
                    width: 2,
                    color: Colors.brown,
                  ))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RadarChart(
                    length: 4,
                    radius: 40,
                    // initialAngle: pi / 5,
                    backgroundColor: Colors.white,
                    borderStroke: 2,
                    borderColor: Colors.grey.shade200,
                    radialStroke: 2,
                    radialColor: Colors.grey.shade200,
                    radars: [
                      RadarTile(
                        values: const [.95, .54, .2, .87],
                        borderStroke: 2,
                        borderColor: Colors.yellow,
                        backgroundColor: Colors.yellow.withOpacity(0.4),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Timothy Huo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, color: secondaryTextColor),
                Text("thuo_hawaii  | ",
                    style: TextStyle(color: secondaryTextColor)),
                Icon(
                  Icons.pin_drop_rounded,
                  color: secondaryTextColor,
                ),
                Text(" Honolulu, HI",
                    style: TextStyle(color: secondaryTextColor)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("38",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    Text("Dishes", style: TextStyle(color: secondaryTextColor)),
                  ],
                ),
                Column(
                  children: [
                    Text("21",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    Text("Friends",
                        style: TextStyle(color: secondaryTextColor)),
                  ],
                ),
                Column(
                  children: [
                    Text("8",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    Text("Special",
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
                          color:
                          favoriteUnderline),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // TODO Change to favorites view if not in favorite view already
                      setState(() {
                        if (favoriteUnderline == inactiveUnderline ){
                          favoriteUnderline = activeUnderline;
                          favoriteIconColor = activeIcon;
                          historyIconColor = inactiveIcon;
                          historyUnderline = inactiveUnderline;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Icon(Icons.favorite,
                        color: favoriteIconColor),
                  ),
                )),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color:
                            historyUnderline),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // TODO Change to history view
                        setState(() {
                          if (historyUnderline == inactiveUnderline ){
                            favoriteUnderline = inactiveUnderline;
                            favoriteIconColor = inactiveIcon;
                            historyIconColor = activeIcon;
                            historyUnderline = activeUnderline;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Icon(Icons.history_edu,
                          color: historyIconColor),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
