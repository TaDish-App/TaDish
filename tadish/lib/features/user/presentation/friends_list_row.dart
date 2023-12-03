import 'package:flutter/material.dart';
import '../../common/taste_prefs_radar_chart.dart';
import 'other_profile_view.dart';

class FriendsListRow extends StatelessWidget {
  final String name;
  final String email;
  final List<double> tastePreference;
  final Icon icon;

  const FriendsListRow({
    Key? key,
    this.name = 'blank',
    this.email = 'blank',
    this.tastePreference = const [0.00, 0.00, 0.00, 0.00],
    this.icon = const Icon(Icons.add_outlined),
  }) : super(key: key);

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
          // Wrap the icon with GestureDetector
          GestureDetector(
            onTap: () {
              // Navigate to OtherProfileView when the icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtherProfileView(email: email),
                ),
              );
            },
            child: icon,
          ),
        ],
      ),
    );
  }
}
