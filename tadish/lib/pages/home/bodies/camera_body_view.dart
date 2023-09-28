import 'package:flutter/material.dart';

/// Displays a list of Gardens.
class CameraBodyView extends StatelessWidget {
  const CameraBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Camera Page'),
      ),
    );
  }
}
