import 'package:flutter/material.dart';

/// Adds 5 pixels of padding around all fields.
class FieldPadding extends StatelessWidget {
  const FieldPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(7.5), child: child);
  }
}
