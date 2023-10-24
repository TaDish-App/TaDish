import 'package:flutter/material.dart';

import 'field_padding.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onSubmit, required this.submissionText});

  final void Function() onSubmit;
  final String submissionText;

  @override
  Widget build(BuildContext context) {
    return FieldPadding(
      child: ElevatedButton(
        onPressed: onSubmit,
        child: Text(
          submissionText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
