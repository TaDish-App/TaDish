import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRatingStatic extends StatelessWidget {
  final double starRating;

  StarRatingStatic({
    super.key, required this.starRating,
  });


  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: starRating,
      itemSize: 10.0,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ), onRatingUpdate: (double value) { },
    );
  }
}
