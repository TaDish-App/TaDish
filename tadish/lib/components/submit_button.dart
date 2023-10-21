import 'package:flutter/material.dart';

import 'field_padding.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onSubmit});

  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return FieldPadding(
      child: ElevatedButton(
        onPressed: onSubmit,
        child: const Text(
          'Submit a new rating!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
