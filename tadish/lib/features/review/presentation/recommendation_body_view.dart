import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import '../domain/dish.dart';
import '../data/dish_provider.dart';
import '../../common/dish_card.dart';
import '../domain/dish_collection.dart';

class RecommendationBodyView extends ConsumerStatefulWidget {
  const RecommendationBodyView({
    super.key,
  });

  @override
  ConsumerState<RecommendationBodyView> createState() =>
      _RecommendationBodyViewState();
}

class _RecommendationBodyViewState
    extends ConsumerState<RecommendationBodyView> {
  final dishesDisplay = StateProvider<List<Dish>>((ref) {
    return [];
  });
  final savedDisplay = StateProvider<List>((ref) {
    return [];
  });

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Dish>> asyncDishesDB = ref.watch(dishesProvider);
    return asyncDishesDB.when(data: (dishes) {
      print("data");
      return _build(context: context, dishes: dishes, ref: ref);
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
      required List<Dish> dishes,
      required WidgetRef ref}) {
    DishCollection dishDB = DishCollection(dishes);
    final dishesRest = dishDB.getDishRestaurant();

    final dishesSwipe = ref.watch(dishesDisplay);
    final saved = ref.watch(savedDisplay);

    Future<void> refresh() async {
      await Future.delayed(Duration.zero); // Delay the execution
      ref.read(dishesDisplay.notifier).state = dishesRest;
      ref.read(savedDisplay.notifier).state = [];
    }

    void swipeLeft() {
      ref.read(dishesDisplay.notifier).state = dishesSwipe.sublist(1);
    }

    void swipeRight() {
      final dish = dishesSwipe[0].name;
      ref.read(savedDisplay.notifier).state = [...saved, dish];
      ref.read(dishesDisplay.notifier).state = dishesSwipe.sublist(1);
    }

    if (dishesSwipe.isEmpty) {
      refresh();
    }

    return Center(
      child: dishesSwipe.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No more cards to swipe!'),
                  ElevatedButton(
                    onPressed: () {
                      refresh();
                    },
                    child: Text('Reload'),
                  ),
                  Text('Saved $saved'),
                  // Display your saved dishes here.
                ],
              ),
            )
          : Stack(
              alignment: Alignment.center,
              children: dishesSwipe.asMap().entries.map((entry) {
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
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: isFrontCard
                            ? DishCard(
                                name: dish.name,
                                picture: dish.pictures[0],
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
                            picture: dish.pictures[0],
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
                )
              }).toList(),
            ),
    );
  }
}
