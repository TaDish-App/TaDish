import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tadish/features/common/form-fields/text_field_decoration.dart';

import '../../../common/form-fields/field_padding.dart';

class SingleLineNumberField extends StatelessWidget {
  final String name;
  final String hint;
  final Key fieldKey;
  final String? currText;

  const SingleLineNumberField({
    required this.name,
    required this.hint,
    required this.fieldKey,
    this.currText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FieldPadding(
      child: Column(
        children: [
          FormBuilderTextField(
            key: fieldKey,
            initialValue: currText ?? "",
            textAlign: TextAlign.center,
            name: name,
            decoration: TextFieldDecoration.textFieldStyle(
              labelTextStr: name,
              hintTextStr: hint,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              // You can add more validators if needed
            ]),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
