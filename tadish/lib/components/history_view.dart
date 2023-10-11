import 'package:flutter/material.dart';
import '../../../components/dish_row_tile.dart';
import '../../../data_model/rating_db.dart';
import '../../../data_model/dish_db.dart';

class HistoryView extends StatelessWidget {
  final String userID;

  const HistoryView({
    super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    final List<RatingData> ratings = ratingsDB.getSingularUserRatings(userID);

    return ratings.isNotEmpty ? ListView(
    // TODO Change the DishRowTile to remove profile avatar and add a date
    children: ratings.map((rating) =>
        DishRowTile(imageUrl: rating.picture, dishName: dishDB.getDishName(rating.dishID), restaurantName: dishDB.getDishRestaurantName(rating.dishID), starRating: rating.starRating, ratingDateTime: rating.createdOn),
    ).toList()) : const Center(
      child: Text("You haven't rated a dish yet!"),

    );
  }
}