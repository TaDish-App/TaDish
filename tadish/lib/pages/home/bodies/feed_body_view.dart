import 'package:flutter/material.dart';

import '../../../components/dish_row_tile.dart';
import 'news_body_item_actions.dart';
import '../../../../pages/sample_feature/sample_item.dart';

/// Displays a list of Gardens.
class FeedBodyView extends StatelessWidget {
  const FeedBodyView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  final List<SampleItem> items;
  final String title = 'Home';

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
            child: ListView(children: const [
              DishRowTile(imageUrl: 'assets/images/1.jpg', dishName: 'Kimchi Fried Rice', restaurantName: 'Seoul Tofu House', starRating: 5,),
              Divider(),
              DishRowTile(dishName: 'Shrimp Scampi', restaurantName: 'Arancino de Mare', starRating: 4),
              Divider(),
              DishRowTile(imageUrl: 'assets/images/2.jpg', dishName: 'Tuna Sushi Rolls', restaurantName: 'Genki Sushi', starRating: 2),
              Divider(),
              DishRowTile(imageUrl: 'assets/images/3.jpg', dishName: 'Grilled Cheese', restaurantName: 'Le Ricardo', starRating: 1),
              Divider(),
              DishRowTile(imageUrl: 'assets/images/4.jpg', dishName: 'Fried Green Tea Ice Cream', restaurantName: 'California Pizza Kitchen', starRating: 5),
            ]),
          ),
        ],
      ),
    );
  }
}