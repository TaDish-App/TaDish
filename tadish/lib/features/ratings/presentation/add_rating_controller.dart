import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tadish/features/picker/data/restaurant_database.dart';
import 'package:tadish/features/picker/data/restaurant_provider.dart';
import 'package:tadish/features/picker/domain/restaurant.dart';

import '../../picker/domain/restaurant_collection.dart';
import '../../review/data/dish_database.dart';
import '../../review/data/dish_provider.dart';
import '../../review/domain/dish.dart';
import '../data/rating_database.dart';
import '../data/rating_provider.dart';
import '../domain/rating.dart';

part 'add_rating_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class AddRatingController extends _$AddRatingController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new rating or edit an existing one.
  Future<void> addRating({
    required Rating rating,
    required String dishName,
    required VoidCallback onSuccess,
    required String restaurantName,
  }) async {
    state = const AsyncLoading();
    RatingDatabase ratingDatabase = ref.watch(ratingDatabaseProvider);

    final newState =
        await AsyncValue.guard(() => ratingDatabase.setRating(rating));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      // Create new dish instance
      DishDatabase dishesDatabase = ref.watch(dishDatabaseProvider);

      // TODO check if dish already exists based on name and location
      final existingDish =
          await AsyncValue.guard(() => dishesDatabase.fetchDish(dishName));

      final restaurants =
          RestaurantCollection(await ref.read(restaurantsProvider.future));
      final restaurantExistsId = restaurants.getRestaurantIdIfExists(restaurantName); // returns "" or an id
      print("restaurantExistsId: $restaurantExistsId");

      // create rest instance here is restaurantExistsId is ""
      RestaurantDatabase restaurantDatabase = ref.watch(restaurantDatabaseProvider);
      final newRestaurantId = 'restaurant-${(restaurants.size() + 1).toString().padLeft(3, '0')}';
      if (restaurantExistsId == "") {
        final newestState = await AsyncValue.guard(() => restaurantDatabase.setRestaurant(Restaurant(id: newRestaurantId, name: restaurantName, city: "Honolulu", state: "HI", location: "2500 Campus Rd, Honolulu, HI 96822", createdOn: DateTime.now())));
      }

      final newDish = Dish(
          id: rating.dishID,
          restaurantID: restaurantExistsId == "" ? 'restaurant-${(restaurants.size() + 1).toString().padLeft(3, '0')}' : restaurantExistsId,
          name: dishName,
          averageStarRating: rating.starRating,
          numRaters: "1",
          averageSweetness: rating.sweetness!,
          averageSourness: rating.sourness!,
          averageSaltiness: rating.saltiness!,
          averageSpiciness: rating.spiciness!,
          createdOn: DateTime.now(),
          pictures: [rating.picture!],
          publicNotes: [rating.publicNote!],
          tags: rating.tags!,
          restaurantName: rating.restaurantName);
      final newState =
          await AsyncValue.guard(() => dishesDatabase.setDish(newDish));
      if (mounted) {
        state = newState;
      }
      if (!state.hasError) {
        onSuccess();
      }
    }
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
