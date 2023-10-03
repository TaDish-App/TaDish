import 'package:flutter/material.dart';
import 'package:radar_chart/radar_chart.dart';

class ProfileBodyView extends StatelessWidget {
  const ProfileBodyView({
    super.key,
  });

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
              height: 10,
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
              height: 10,
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
                    Text("21", style: TextStyle(
                      fontSize: 20,
                    )),
                    Text("Friends",
                        style: TextStyle(color: secondaryTextColor)),
                  ],
                ),
                Column(
                  children: [
                    Text("8", style: TextStyle(
                      fontSize: 20,
                    )),
                    Text("Special",
                        style: TextStyle(color: secondaryTextColor)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Icon(Icons.favorite)),
                TextButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  child: const Icon(Icons.history_edu),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
