import 'package:flutter/material.dart';
import '../../../components/taste_prefs_radar_chart.dart';

class FriendsListRow extends StatelessWidget {
  final String name;
  final List<double> tastePreference;
  final Icon icon;

  const FriendsListRow({
    super.key, this.name = 'blank', this.tastePreference = const [0.00, 0.00, 0.00, 0.00], this.icon = const Icon(Icons.add_outlined),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Radar Chart for taste prefs
          TastePrefsRadarChart(tastePrefsData: tastePreference, radius: 20,),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          icon,
        ],
      )
    );
  }
}