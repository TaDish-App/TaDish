import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tadish/features/picker/domain/restaurant.dart';

import 'restaurant_database.dart';

part 'restaurant_provider.g.dart';

@riverpod
RestaurantDatabase restaurantDatabase(RestaurantDatabaseRef ref) {
  return RestaurantDatabase(ref);
}

@riverpod
Stream<List<Restaurant>> restaurants(RestaurantsRef ref) {
  final database = ref.watch(restaurantDatabaseProvider);
  return database.watchRestaurants();
}