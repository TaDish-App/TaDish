import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../circle_image_selector.dart';

class ImagesField extends StatelessWidget {
  final String name;
  final Key fieldKey;
  final String? currImage;

  const ImagesField({
    required this.name,
    required this.fieldKey,
    this.currImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: 'Images Field',
      key: fieldKey,
      initialValue: currImage,
      // TODO replace with template image
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      builder: (FormFieldState<dynamic> field) {
        return CircleImageSelector(field: field);
      },
    );
  }
}
