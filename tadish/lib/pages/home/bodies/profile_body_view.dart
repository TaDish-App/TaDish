import 'package:flutter/material.dart';
import 'package:radar_chart/radar_chart.dart';

class ProfileBodyView extends StatelessWidget {
  const ProfileBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Icon(Icons.person),
                Text("thuo_hawaii  | "),
                Icon(Icons.pin_drop_rounded),
                Text(" Honolulu, HI"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
