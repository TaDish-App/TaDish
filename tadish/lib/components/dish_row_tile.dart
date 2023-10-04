import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tadish/components/star_rating_static.dart';
import 'package:tadish/components/taste_prefs_radar_chart.dart';

import '../pages/home/bodies/news_body_item_actions.dart';

class DishRowTile extends StatelessWidget {
  final String imageUrl;
  final String dishName;
  final String restaurantName;
  final double starRating;

  const DishRowTile({
    super.key, this.imageUrl = 'assets/images/5.jpg', required this.dishName, required this.restaurantName, required this.starRating,
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
        child: Image.asset(imageUrl, fit: BoxFit.cover),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
            child: StarRatingStatic(starRating: starRating),
          ),
          Text(
              dishName),
        ],
      ),
      subtitle: Text(
          restaurantName),
      trailing: const TastePrefsRadarChart(tastePrefsData: [0.5, 0.66, 0.89, 0.72], radius: 15),
    );
  }
}

