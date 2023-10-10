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

    return ListView(
    // TODO Change the DishRowTile to remove profile avatar and add a date
    children: ratings.map((rating) =>
        DishRowTile(imageUrl: rating.picture, dishName: dishDB.getDishName(rating.dishID), restaurantName: dishDB.getDishRestaurantName(rating.dishID), starRating: rating.starRating),
    ).toList()
    //   const [
    //   DishRowTile(
    //     imageUrl: 'assets/images/1.jpg',
    //     dishName: 'Kimchi Fried Rice',
    //     restaurantName: 'Seoul Tofu House',
    //     starRating: 5,
    //   ),
    //   Divider(),
    //   DishRowTile(
    //       dishName: 'Shrimp Scampi',
    //       restaurantName: 'Arancino de Mare',
    //       starRating: 4),
    //   Divider(),
    //   DishRowTile(
    //       imageUrl: 'assets/images/2.jpg',
    //       dishName: 'Tuna Sushi Rolls',
    //       restaurantName: 'Genki Sushi',
    //       starRating: 2),
    //   Divider(),
    //   DishRowTile(
    //       imageUrl: 'assets/images/3.jpg',
    //       dishName: 'Grilled Cheese',
    //       restaurantName: 'Le Ricardo',
    //       starRating: 1),
    //   Divider(),
    //   DishRowTile(
    //       imageUrl: 'assets/images/4.jpg',
    //       dishName: 'Fried Green Tea Ice Cream',
    //       restaurantName: 'California Pizza Kitchen',
    //       starRating: 5),
    // ],
                  );
  }
}