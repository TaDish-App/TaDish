import 'package:flutter/material.dart';
import 'package:tadish/features/review/domain/dish_collection.dart';

import '../../common/dish_row_tile.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import '../data/dish_provider.dart';
import '../domain/dish.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DishFilter { vegan, vegetarian, local }

final filterProvider = StateProvider<List<String>>((ref) => []);

class SavedBodyView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    final filters = ref.watch(filterProvider);
    DishCollection dishDB = DishCollection(dishes);
    final List<Dish> dishesWithRestaurant = dishDB.getDishRestaurant();
    List<Dish> filteredDishes = dishesWithRestaurant.where((dish) {
      return filters.every((filter) => dish.tags.contains(filter));
    }).toList();
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(children: [
          SizedBox(
            height: 50,
            child: Wrap(
            spacing: 5.0,
            children: DishFilter.values.map((DishFilter filter) {
              return FilterChip(
                label: Text(filter.name),
                selected: filters.contains(filter.name),
                onSelected: (bool selected) {
                  if (selected) {
                    ref.read(filterProvider.notifier).state = [...filters, filter.name];
                  } else {
                    ref.read(filterProvider.notifier).state = filters.where((str) => str != filter.name).toList();
                  }
                },
              );
            }).toList(),
          ),
          ),
          Expanded(
            child: Center(
              child: filteredDishes.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('No saved dishes!'),
                          ]))
                  : Container(
                      alignment: Alignment.center,
                      child: ListView(
                          children: filteredDishes
                              .map(
                                (dish) => DishRowTile(
                                    imageUrl: dish.pictures[0],
                                    dishName: dish.name,
                                    restaurantName: dish.restaurantName,
                                    starRating: dish.averageStarRating,
                                    tastePrefs: [
                                      dish.averageSweetness,
                                      dish.averageSourness,
                                      dish.averageSpiciness,
                                      dish.averageSaltiness
                                    ]),
                              )
                              .toList())),
            ),
          ),
        ]));
  }
}
