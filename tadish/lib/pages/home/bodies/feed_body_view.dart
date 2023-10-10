import 'package:flutter/material.dart';

import '../../../components/dish_row_tile.dart';
import '../../../data_model/dish_db.dart';

class FeedBodyView extends StatelessWidget {
  final List<DishData> dishes = dishDB.getDishRestaurant();

  FeedBodyView({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                FilterChip(label: Text("Vegan"), onSelected: null),
                FilterChip(label: Text("Local"), onSelected: null),
                FilterChip(label: Text("Spicy"), onSelected: null),
                FilterChip(label: Text("Oldest First"), onSelected: null),
              ],
            ),
          ),
          Expanded(
            child: Center(
                child: dishes.isEmpty
                    ? Container(
                  alignment: Alignment.center,
                  child: const Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No saved dishes!'),
                    ]
                  )
                ) : Container(
                    alignment: Alignment.center,
                    child: ListView(children: dishes.map((dish) =>
                      DishRowTile(imageUrl: dish.pictures[0], dishName: dish.name, restaurantName: dish.restaurant!.name, starRating: dish.averageStarRating, tastePrefs: [dish.averageSweetness, dish.averageSourness, dish.averageSpiciness, dish.averageSaltiness]),
                    ).toList())
                ),
          ),
      ),
    ])
    );
  }
}