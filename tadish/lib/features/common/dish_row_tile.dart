import 'package:flutter/material.dart';
import 'package:tadish/features/common/star_rating_static.dart';
import 'package:tadish/features/common/taste_prefs_radar_chart.dart';

class DishRowTile extends StatelessWidget {
  final String imageUrl;
  final String dishName;
  final String restaurantName;
  final double starRating;
  final List<double>? tastePrefs;
  final String? ratingDateTime;

  const DishRowTile({
    super.key,
    this.imageUrl = 'assets/images/logo_dark.png',
    this.ratingDateTime,
    this.tastePrefs,
    required this.dishName,
    required this.restaurantName,
    required this.starRating,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 50,
        ),
        child: imageUrl.startsWith("assets/images") ? Image.asset(imageUrl, fit: BoxFit.cover) : Image.network(imageUrl, fit: BoxFit.cover),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
            child: StarRatingStatic(starRating: starRating),
          ),
          Text(dishName),
        ],
      ),
      subtitle: Text(restaurantName),
      trailing: ratingDateTime != null
          ? Text(
              "${DateTime.parse(ratingDateTime!).month.toString().padLeft(2, '0')}-${DateTime.parse(ratingDateTime!).day.toString().padLeft(2, '0')}-${DateTime.parse(ratingDateTime!).year.toString().substring(2)}",
              style: const TextStyle(fontWeight: FontWeight.normal),
            )
          : TastePrefsRadarChart(tastePrefsData: tastePrefs!, radius: 15),
    );
  }
}
