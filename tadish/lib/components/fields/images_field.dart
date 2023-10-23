import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../circle_image_selector.dart';
import '../field_padding.dart';

class ImagesField extends StatelessWidget {
  final String name;
  final Key fieldKey;

  const ImagesField({
    required this.name,
    required this.fieldKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: 'Images Field',
      key: fieldKey,
      initialValue: null,
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
