import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SliderField extends StatefulWidget {
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>
      fieldKey;
  final String name;
  final MaterialColor color;

  const SliderField({
    super.key,
    required this.fieldKey,
    required this.name,
    required this.color,
  });

  @override
  State<SliderField> createState() => _SliderFieldState();
}

class _SliderFieldState extends State<SliderField> {
  final double _initialSliderValue = 50;
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: widget.name,
      key: widget.fieldKey,
      // _sliderSweetnessFieldKey.currentState?.value
      initialValue: _initialSliderValue,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      builder: (FormFieldState<dynamic> field) {
        _currentSliderValue = field.value == _initialSliderValue
            ? _initialSliderValue
            : _currentSliderValue;
        return Column(
          children: [
            Text(widget.name),
            Slider(
              value: _currentSliderValue,
              max: 100,
              divisions: 10,
              label: _currentSliderValue.round().toString(),
              activeColor: widget.color,
              inactiveColor: widget.color.shade100,
              thumbColor: widget.color,
              onChanged: (double value) {
                field.didChange(value);
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ],
        );
      },
    );
  }
}
