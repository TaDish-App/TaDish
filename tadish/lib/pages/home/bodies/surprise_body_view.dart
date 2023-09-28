import 'package:flutter/material.dart';

import '../../../components/garden_summary_card.dart';

/// Displays a list of Gardens.
class SurpriseBodyView extends StatelessWidget {
  const SurpriseBodyView({
    super.key,
  });

  final String title = 'Gardens';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Surprise Page'),
      ),
    );
  }
}
