import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:async';

class SurpriseBodyView extends StatefulWidget {
  @override
  _SurpriseBodyViewState createState() => _SurpriseBodyViewState();
  }

class _SurpriseBodyViewState extends State<SurpriseBodyView> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'HiTEA',
      'HiTEA',
      'HiTEA',
      'HiTEA',
      'HiTEA',
      'HiTEA',
      'TacoBell',
      'HiTEA',
    ];

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(
              Fortune.randomInt(0, items.length),
            );
          });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                indicators: const <FortuneIndicator>[
                  FortuneIndicator(
                    alignment: Alignment.bottomCenter,
                    child: TriangleIndicator(
                      color: Colors.white,
                    ),
                  ),
                ],
                items: [
                  for (var it in items) FortuneItem(
                      child: Text(it),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Adjust spacing as needed
            Text(
              'Selected Result: $selected',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
