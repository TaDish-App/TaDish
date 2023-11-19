import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/dish.dart';
import 'dish_database.dart';

part 'dish_provider.g.dart';

@riverpod
DishDatabase dishDatabase(DishDatabaseRef ref) {
  return DishDatabase(ref);
}

@riverpod
Stream<List<Dish>> dishes(DishesRef ref) {
  final database = ref.watch(dishDatabaseProvider);
  return database.watchDishes();
}
