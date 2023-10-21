import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:path/path.dart';
import 'package:tadish/components/field_padding.dart';
import '../../../../components/circle_image_selector.dart';
import '../../../../components/fields/single_line_text_field.dart';
import '../../../../components/fields/star_field.dart';
import '../../../../components/slider.dart';
import '../../../../components/star_confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../components/submit_button.dart';

class CameraBodyView extends ConsumerWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final _starsFieldKey = GlobalKey<FormBuilderFieldState>();
  final _restaurantNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _dishNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _imageFieldKey = GlobalKey<FormBuilderFieldState>();

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

      // Add the new rating
      print("stars $stars");
      print("restaurantName $restaurantName");
      print("dishName $dishName");

      // Reset form
    }

    // Build a Form widget using the _formKey created above.
    return Container(
        padding: const EdgeInsets.fromLTRB(32, 15, 32, 32),
        child: Column(
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FieldPadding(
                      child: CircleImageSelector(fieldKey: _imageFieldKey)),
                  StarField(fieldKey: _starsFieldKey),
                  SingleLineTextField(
                      name: "Restaurant",
                      hint: "Enter the location",
                      fieldKey: _restaurantNameFieldKey),
                  SingleLineTextField(
                      name: "Dish Name",
                      hint: "Enter the dish name",
                      fieldKey: _dishNameFieldKey),
                ],
              ),
            ),
            SubmitButton(onSubmit: onSubmit),
          ],
        ));
  }
}
