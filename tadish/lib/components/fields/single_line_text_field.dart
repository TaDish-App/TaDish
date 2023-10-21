import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tadish/components/text_field_decoration.dart';

import '../field_padding.dart';

class SingleLineTextField extends StatelessWidget {
  final String name;
  final String hint;
  final Key fieldKey;

  const SingleLineTextField({
    required this.name,
    required this.hint,
    required this.fieldKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FieldPadding(
      child: Column(
        children: [
          FormBuilderTextField(
            key: fieldKey,
            textAlign: TextAlign.center,
            name: name,
            decoration: TextFieldDecoration.textFieldStyle(
                labelTextStr: name, hintTextStr: hint),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
        ],
      ),
    );
  }
}
