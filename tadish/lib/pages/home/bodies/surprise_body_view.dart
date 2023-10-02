import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:async';
import '../../../custom_theme.dart';

class SurpriseBodyView extends StatefulWidget {
  @override
  _SurpriseBodyViewState createState() => _SurpriseBodyViewState();
  }

class _SurpriseBodyViewState extends State<SurpriseBodyView> {
  StreamController<int> selected = StreamController<int>();
  int result = -1;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      '1', 
      '2',
      '3',
      '4',
      '5',
      '6',
      'TacoBell',
      '8',
    ];

    final alternatingColors = [customLightBrownColor, customDarkBrownColor];
    int colorIndex = 0;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            final selectedValue = Fortune.randomInt(0, items.length);
            selected.add(selectedValue);
            result = selectedValue;
          });
        },
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Text(
              'Spin the Wheel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                indicators: const <FortuneIndicator>[
                  FortuneIndicator(
                    alignment: Alignment.topCenter,
                    child: TriangleIndicator(
                      color: customPrimaryColor,
                    ),
                  ),
                ],
                items: [
                  for (var i = 0; i < items.length; i++)
                    FortuneItem(
                      child: Text(items[i]),
                      style: FortuneItemStyle(
                        color: alternatingColors[i % alternatingColors.length],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Adjust spacing as needed
            if (result >= 0) // Display result if a valid result is available
              Text(
                'Selected Result: ${items[result]}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
