import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/dish.dart';

/// Provides access to the Firestore database storing [Dish] documents.
class DishDatabase {
  DishDatabase(this.ref);

  final ProviderRef<DishDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Dish>> watchDishes() => _service.watchCollection(
      path: FirestorePath.dishes(),
      builder: (data, documentId) => Dish.fromJson(data!));

  Stream<Dish> watchDish(String dishId) => _service.watchDocument(
      path: FirestorePath.dish(dishId),
      builder: (data, documentId) => Dish.fromJson(data!));

  Future<List<Dish>> fetchDishes() => _service.fetchCollection(
      path: FirestorePath.dishes(),
      builder: (data, documentId) => Dish.fromJson(data!));

  Future<Dish> fetchDish(String dishId) => _service.fetchDocument(
      path: FirestorePath.dish(dishId),
      builder: (data, documentId) => Dish.fromJson(data!));

  Future<void> setDish(Dish dish) => _service.setData(
      path: FirestorePath.dish(dish.id), data: dish.toJson());

  Future<void> setDishDelayed(Dish dish) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.dish(dish.id), data: dish.toJson()));

  Future<void> setDishError(Dish dish) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteDish(Dish dish) =>
      _service.deleteData(path: FirestorePath.dish(dish.id));
}
