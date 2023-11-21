import 'package:flutter/material.dart';
import 'package:tadish/features/review/domain/dish_collection.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import '../domain/dish.dart';
import '../data/dish_provider.dart';
import '../../common/dish_card.dart';

class RecommendationBodyView extends ConsumerWidget {
  const RecommendationBodyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Dish>> asyncDishesDB = ref.watch(dishesProvider);
    return asyncDishesDB.when(data: (dishes) {
      print("data");
      return _build(context: context, dishesParent: dishes, ref: ref);
    }, loading: () {
      print("loading");
      return const TadishLoading();
    }, error: (error, stacktrace) {
      print("error");
      print("asyncDishesDB.toString(): " + asyncDishesDB.toString());
      print("asyncDishesDB.error: " + asyncDishesDB.error.toString());
      print("dishes.toString(): " + dishes.toString());
      print("error.toString(): " + error.toString());
      return TadishError(error.toString(), stacktrace.toString());
    });
  }
  
  Widget _build(
      {required BuildContext context,
      required List<Dish> dishesParent,
      required WidgetRef ref}) {
      
      DishCollection dishDB = DishCollection(dishesParent);
      final dishes = dishDB.getDishRestaurant();
      
      void swipeLeft() {
        print(dishes);
      }

    void swipeRight() {
        print(dishes);
    }

      return Center(
        child: dishes.isEmpty
            ? Container(
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No more cards to swipe!'),
              Text('Saved'),
              // Display your saved dishes here.
            ],
          ),
        )
            : Stack(
          alignment: Alignment.center,
          children: dishes.asMap().entries.map((entry) {
            final index = entry.key;
            final dish = entry.value;
            final isFrontCard = index == 0;
  
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Draggable(
                onDragEnd: (details) {
                  if (details.offset.dx < -100) {
                    // Swiped left
                    swipeLeft();
                  } else if (details.offset.dx > 100) {
                    // Swiped right
                    swipeRight();
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
