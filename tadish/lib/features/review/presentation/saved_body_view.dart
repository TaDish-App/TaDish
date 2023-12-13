import 'package:flutter/material.dart';
import 'package:tadish/features/review/domain/dish_collection.dart';
import 'package:tadish/features/review/presentation/dishDialog.dart';

import '../../common/dish_row_tile.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import '../data/dish_provider.dart';
import '../domain/dish.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../dish_rating_user_data_provider.dart';
import 'package:tadish/features/ratings/domain/rating.dart';
import 'package:tadish/features/user/domain/user.dart';
import 'package:tadish/features/user/domain/user_collection.dart';

enum DishFilter { vegan, vegetarian, local }

final filterProvider = StateProvider<List<String>>((ref) => []);

class SavedBodyView extends ConsumerWidget {
  const SavedBodyView({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final AsyncValue<DishRatingUser> asyncDishRatingUser = ref.watch(dishRatingUserProvider);

    return asyncDishRatingUser.when(
        data: (dishRatingUser) => _build(
            context: context,
            dishes: dishRatingUser.dishes,
            ratings: dishRatingUser.ratings,
            users: dishRatingUser.users,
            currentUserEmail: dishRatingUser.currentUserEmail,
            ref: ref),
        loading: () => const TadishLoading(),
        error: (error, stacktrace) =>
            TadishError(error.toString(), stacktrace.toString()));
  }

  Widget _build({required BuildContext context,
    required List<Rating> ratings,
    required List<User> users,
    required List<Dish> dishes,
    required String currentUserEmail,
    required WidgetRef ref}) {
    final filters = ref.watch(filterProvider);
    // load collections
    DishCollection dishDB = DishCollection(dishes);
    final List<Dish> dishesWithRestaurant = dishDB.getDishRestaurant();
    final UserCollection userDB = UserCollection(users);
    final User currentUser = userDB.getUser(currentUserEmail);
    // get users saved dishes
    final List<String> userDishes = currentUser.savedDishesID;
    // find users saved dishes
    final List<Dish> myDishes = dishesWithRestaurant.where((dish) {
      return userDishes.contains(dish.id);
    }).toList();
    // filter users saved dishes by tags
    List<Dish> filteredDishes = myDishes.where((dish) {
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
                                (dish) => GestureDetector(
                                   child: DishRowTile(
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
                                    onTap: (){
                                     showDialog<String>(
                                     context: context,
                                     builder: (BuildContext context) => 
                                      DishDialog(dishName: dish.name,
                                      imageUrl: dish.pictures[0],
                                      restaurantName: dish.restaurantName,
                                      starRating: dish.averageStarRating,
                                      averageSaltiness: dish.averageSaltiness, 
                                      averageSourness: dish.averageSourness,
                                      averageSpiciness: dish.averageSpiciness,
                                      averageSweetness: dish.averageSweetness,
                                      publicNote: dish.publicNotes[0],
                                      tags: dish.tags)
                                     );
                                    }
                                ),
                              )
                              .toList())),
            ),
          ),
        ]));
  }
}
