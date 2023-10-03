import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../components/roll_button.dart';

import 'dart:async';
import 'dart:math';
import '../../../custom_theme.dart';

class SurpriseBodyView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final items = <String>[
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
    ];

    final alternatingColors = [customLightBrownColor, customDarkBrownColor];

    StreamController<int> selected = useStreamController<int>();

    final selectedIndex = useStream(selected.stream, initialData: 0).data ?? 0;
    final isAnimating = useState(false);

    void handleRoll() {
      selected.add(
        roll(items.length),
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text(
              'Spin the Wheel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RollButtonWithPreview(
              selected: selectedIndex,
              items: items,
              onPressed: isAnimating.value ? null : handleRoll,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: FortuneWheel(
                selected: selected.stream, // Use the same stream here
                onAnimationStart: () => isAnimating.value = true,
                onAnimationEnd: () => isAnimating.value = false,
                onFling: handleRoll,
                items: [
                  for (var i = 0; i < items.length; i++)
                    FortuneItem(
                        child: Text(items[i]),
                        onTap: () => print(items[i]),
                        style: FortuneItemStyle(
                          color: alternatingColors[i %
                              alternatingColors.length],
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
