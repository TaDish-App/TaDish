import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../components/fields/images_field.dart';
import '../../../../components/fields/single_line_text_field.dart';
import '../../../../components/fields/slider_field.dart';
import '../../../../components/fields/star_field.dart';
import '../../../../components/fields/tags_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../components/submit_button.dart';

class CameraBodyView extends ConsumerWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final _starsFieldKey = GlobalKey<FormBuilderFieldState>();
  final _restaurantNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _dishNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _imageFieldKey = GlobalKey<FormBuilderFieldState>();
  final _tagsFieldKey = GlobalKey<FormBuilderFieldState>();
  final _publicNotesFieldKey = GlobalKey<FormBuilderFieldState>();
  final _privateNotesFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSweetnessFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSournessFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSaltinessFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSpicinessFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onSubmit() {
      print("Creating a new rating!");

      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;

      if (!isValid) return;
      // Since validation passed, we can safely access the values.
      double stars = _starsFieldKey.currentState?.value;
      String restaurantName = _restaurantNameFieldKey.currentState?.value;
      String dishName = _dishNameFieldKey.currentState?.value;
      List<String> tags = _tagsFieldKey.currentState?.value;
      String publicNotes = _publicNotesFieldKey.currentState?.value;
      String privateNotes = _privateNotesFieldKey.currentState?.value;
      double sweetnessSlider = _sliderSweetnessFieldKey.currentState?.value;
      double sournessSlider = _sliderSournessFieldKey.currentState?.value;
      double spicinessSlider = _sliderSpicinessFieldKey.currentState?.value;
      double saltinessSlider = _sliderSaltinessFieldKey.currentState?.value;
      String image = _imageFieldKey.currentState?.value;

      // Add the new rating
      print("stars $stars");
      print("restaurantName $restaurantName");
      print("dishName $dishName");
      print(tags);
      print("publicNotes $publicNotes");
      print("privateNotes $privateNotes");
      print("sweetnessSlider $sweetnessSlider");
      print("sournessSlider $sournessSlider");
      print("spicinessSlider $spicinessSlider");
      print("saltinessSlider $saltinessSlider");
      print("image: $image");

      // Reset form
      _formKey.currentState!.fields['Image']
          ?.reset();
      _formKey.currentState?.reset();
    }

    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.fromLTRB(32, 15, 32, 32),
          child: Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // TODO Image picking
                    ImagesField(fieldKey: _imageFieldKey, name: "Image"),
                    // FieldPadding(
                    //     child: CircleImageSelector(fieldKey: _imageFieldKey)),
                    StarField(fieldKey: _starsFieldKey),
                    SingleLineTextField(
                        name: "Restaurant",
                        hint: "Enter the location",
                        fieldKey: _restaurantNameFieldKey),
                    SingleLineTextField(
                        name: "Dish Name",
                        hint: "Enter the dish name",
                        fieldKey: _dishNameFieldKey),
                    TagsField(name: "Tags", fieldKey: _tagsFieldKey),
                    Row(
                      children: [
                        Flexible(
                          child: SingleLineTextField(
                              name: "Public Notes",
                              hint: "Public Notes",
                              fieldKey: _publicNotesFieldKey),
                        ),
                        Flexible(
                          child: SingleLineTextField(
                              name: "Private Notes",
                              hint: "Private Notes",
                              fieldKey: _privateNotesFieldKey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SliderField(
                  fieldKey: _sliderSweetnessFieldKey,
                  name: "Sweetness",
                  color: Colors.pink),
              SliderField(
                  fieldKey: _sliderSournessFieldKey,
                  name: "Sourness",
                  color: Colors.lime),
              SliderField(
                  fieldKey: _sliderSpicinessFieldKey,
                  name: "Spiciness",
                  color: Colors.orange),
              SliderField(
                  fieldKey: _sliderSaltinessFieldKey,
                  name: "Saltiness",
                  color: Colors.blueGrey),
              SubmitButton(onSubmit: onSubmit),
            ],
          )),
    );
  }
}
