import 'package:flutter/material.dart';

class InactiveSliderExample extends StatefulWidget {
  const InactiveSliderExample({super.key, required this.color, required this.value});
  final MaterialColor color;
  final double value;

  @override
  State<InactiveSliderExample> createState() => _InactiveSliderExampleState(color, value);
}

class _InactiveSliderExampleState extends State<InactiveSliderExample> {
  double value;
  MaterialColor color;

  _InactiveSliderExampleState(this.color, this.value) {
    color = color;
    value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
        max: 100,
        divisions: 10,
        label: value.round().toString(),
        activeColor: color,
        inactiveColor: color.shade100,
        thumbColor: color,
        value: value,
        onChanged: (double value) {  },
    );
  }
}