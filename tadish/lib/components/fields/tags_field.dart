import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TagsField extends StatelessWidget {
  final Key fieldKey;
  final String name;

  TagsField({
    super.key, required this.fieldKey, required this.name,
  });

  static final List<String> tagValues = ["Vegan", "Local", "Vegetarian"];
  static final List<Icon> tagIcons = [
    const Icon(Icons.energy_savings_leaf),
    const Icon(Icons.assistant_photo_rounded),
    const Icon(Icons.auto_awesome_rounded)
  ];

  // Create a list of FormBuilderChipOption<String> tags
  List<FormBuilderChipOption<String>> tags = List.generate(
    tagValues.length,
    (index) {
      return FormBuilderChipOption<String>(
        value: tagValues[index],
        avatar: tagIcons.elementAt(index), // You can use the index here
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return FormBuilderFilterChip(
        key: fieldKey,
        name: name,
        options: tags,
        decoration: const InputDecoration(
            border: InputBorder.none, fillColor: Colors.transparent),
        alignment: WrapAlignment.center,
    );
  }
}
