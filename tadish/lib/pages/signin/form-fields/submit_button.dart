import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onSubmit});

  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onSubmit,
        child: const Text('Sign in'),
    );
  }
}
