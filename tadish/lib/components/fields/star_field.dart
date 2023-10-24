import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../field_padding.dart';

/// A text field to support defining new or revised garden names.
class StarField extends StatelessWidget {
  const StarField({super.key, required this.fieldKey, this.currStars});

  final double? currStars;
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>
      fieldKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: 'Stars Field',
      key: fieldKey,
      initialValue: currStars ?? 3.0,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      builder: (FormFieldState<dynamic> field) {
        return FieldPadding(
          child: RatingBar.builder(
            initialRating: currStars ?? 3.0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) => {
              field.didChange(rating),
            },
          ),
        );
      },
    );
  }
}

// FormBuilderTextField(
// name: fieldName,
// key: fieldKey,
// initialValue: currName,
// decoration: InputDecoration(
// labelText: fieldName,
// hintText: 'Example: "Rosebud Garden"',
// ),
// validator: FormBuilderValidators.compose([
// FormBuilderValidators.required(),
// ]),
// ),
