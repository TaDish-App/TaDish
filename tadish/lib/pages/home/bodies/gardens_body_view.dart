import 'package:flutter/material.dart';

import '../../../components/garden_summary_card.dart';

/// Displays a list of Gardens.
class GardensBodyView extends StatelessWidget {
  const GardensBodyView({
    super.key,
  });

  final String title = 'Gardens';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: const [
          GardenSummaryCard(),
        ]));
  }
}
