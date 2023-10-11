import 'package:flutter/material.dart';
import 'package:radar_chart/radar_chart.dart';
import 'dart:math';

class TastePrefsRadarChart extends StatelessWidget {
  final List<double> tastePrefsData;
  final double radius;
  const TastePrefsRadarChart({
    super.key, required this.tastePrefsData, required this.radius
  });

  @override
  Widget build(BuildContext context) {
    // TODO save color per dish and profile
    var randColor = Random().nextInt(Colors.primaries.length);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(
              side: BorderSide(
            width: 0.5,
            color: Colors.brown,
          ))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadarChart(
            length: 4,
            radius: radius,
            // initialAngle: pi / 5,
            backgroundColor: Colors.white,
            borderStroke: 2,
            borderColor: Colors.grey.shade200,
            radialStroke: 2,
            radialColor: Colors.grey.shade200,
            radars: [
              RadarTile(
                values: tastePrefsData,
                borderStroke: 2,
                borderColor: Colors.primaries[randColor],
                backgroundColor: Colors.primaries[randColor].withAlpha(40),
              )
            ],
          ),
        ],
      ),
    );
  }
}
