import 'package:flutter/material.dart';
import '../../../components/dish_card.dart';
import '../../../data_model/dish_db.dart';

class RecommendationBodyView extends StatefulWidget {
  @override
  _RecommendationBodyViewState createState() => _RecommendationBodyViewState();
}

class _RecommendationBodyViewState extends State<RecommendationBodyView> {
  List<DishData> dishes = dishDB.getDishes();

  void _swipeLeft() {
    setState(() {
      dishes.removeAt(0);
    });
  }

  void _swipeRight() {
    setState(() {
      saved.add(dishes[0].name);
      dishes.removeAt(0);
    });
  }

  List<String> saved = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: dishes.isEmpty
          ? Container(
            alignment: Alignment.center,
            child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No more cards to swipe!'),
                  Text('Saved: $saved'),
                ]
            )
          )
          : Stack(
        alignment: Alignment.center,
        children: dishes.map((dish) {
          final index = dishes.indexOf(dish);
          final isFrontCard = index == 0;

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Draggable(
              onDragEnd: (details) {
                if (details.offset.dx < -100) {
                  // Swiped left
                  _swipeLeft();
                } else if (details.offset.dx > 100) {
                  // Swiped right
                  _swipeRight();
                }
              },
              feedback: Material(
                elevation: isFrontCard ? 8 : 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: isFrontCard
                      ? DishCard(
                    name: dish.name,
                    cost: dish.cost,
                    picture: AssetImage(dish.pictures[0]),
                    sweetness: dish.averageSweetness,
                    sourness: dish.averageSourness,
                    saltiness: dish.averageSaltiness,
                    spiciness: dish.averageSpiciness,
                    numRaters: dish.numRaters,
                  )
                      : Container(
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ),
              childWhenDragging: Container(),
              child: isFrontCard
                  ? DishCard(
                name: dish.name,
                cost: dish.cost,
                picture: AssetImage(dish.pictures[0]),
                sweetness: dish.averageSweetness,
                sourness: dish.averageSourness,
                saltiness: dish.averageSaltiness,
                spiciness: dish.averageSpiciness,
                numRaters: dish.numRaters,
              )
                  : Container(
                width: 100.0,
                height: 100.0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
