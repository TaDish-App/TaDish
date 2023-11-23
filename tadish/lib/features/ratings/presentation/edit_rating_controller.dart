import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tadish/features/review/domain/dish_collection.dart';

import '../../review/data/dish_database.dart';
import '../../review/data/dish_provider.dart';
import '../../review/domain/dish.dart';
import '../data/rating_database.dart';
import '../data/rating_provider.dart';
import '../domain/rating.dart';

part 'edit_rating_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditRatingController extends _$EditRatingController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new rating or edit an existing one.
  Future<void> updateRating({
    required Rating updatedRating,
    required String updatedDishName,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    RatingDatabase ratingDatabase = ref.watch(ratingDatabaseProvider);
    var newState =
        await AsyncValue.guard(() => ratingDatabase.setRating(updatedRating));
    if (mounted) {
      state = newState;
    }

    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      DishDatabase dishesDatabase = ref.watch(dishDatabaseProvider);
      final dish = await AsyncValue.guard(
          () => dishesDatabase.fetchDish(updatedRating.dishID));
      // TODO if editing restaurant name or dish name, then need to create new instance of dish unless solo rating of dish
      // Check rating.restaurantName or rating.dishName is not the same as dishid's one

      // else update average star, 4 S's, public notes, and tags

      Dish updatedDish = createNewDish(
          updatedRating, updatedDishName, id: dish.value!.id, dish.value);
      newState =
          await AsyncValue.guard(() => dishesDatabase.setDish(updatedDish));
      onSuccess();
    }
  }

  Dish createNewDish(ratingInfo, dishName, dish, {id}) {
    String newID =
        id ?? 'dish-800'; // FIXME dynamically change based on size of dishesdb
    // 'dish-${(dishCollection.getSize() + 1).toString().padLeft(3, '0')}';
    return Dish(
        id: newID,
        restaurantID: dish.restaurantID,
        name: dishName,
        averageStarRating: ratingInfo.starRating,
        numRaters: "1",
        averageSweetness: ratingInfo.sweetness!,
        averageSourness: ratingInfo.sourness!,
        averageSaltiness: ratingInfo.saltiness!,
        averageSpiciness: ratingInfo.spiciness!,
        createdOn: DateTime.now(),
        pictures: ["assets/images/1.jpg"],
        publicNotes: [ratingInfo.publicNote!],
        tags: ratingInfo.tags!,
        restaurantName: ratingInfo.restaurantName);
  }

  Future<void> deleteRating({
    required Rating rating,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    RatingDatabase ratingDatabase = ref.watch(ratingDatabaseProvider);
    final newState =
        await AsyncValue.guard(() => ratingDatabase.deleteRating(rating));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
