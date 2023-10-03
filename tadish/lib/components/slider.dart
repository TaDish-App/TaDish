import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key, required this.color});
  final MaterialColor color;

  @override
  State<SliderExample> createState() => _SliderExampleState(color);
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 20;
  MaterialColor color;

  _SliderExampleState(this.color) {
    color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 10,
        label: _currentSliderValue.round().toString(),
        activeColor: color,
        inactiveColor: color.shade100,
        thumbColor: color,
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
    );
  }
}