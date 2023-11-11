import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/restaurant.dart';

/// Provides access to the Firestore database storing [Restaurant] documents.
class RestaurantDatabase {
  RestaurantDatabase(this.ref);

  final ProviderRef<RestaurantDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Restaurant>> watchRestaurants() => _service.watchCollection(
      path: FirestorePath.restaurants(),
      builder: (data, documentId) => Restaurant.fromJson(data!));

  Stream<Restaurant> watchRestaurant(String restaurantId) => _service.watchDocument(
      path: FirestorePath.restaurant(restaurantId),
      builder: (data, documentId) => Restaurant.fromJson(data!));

  Future<List<Restaurant>> fetchRestaurants() => _service.fetchCollection(
      path: FirestorePath.restaurants(),
      builder: (data, documentId) => Restaurant.fromJson(data!));

  Future<Restaurant> fetchRestaurant(String restaurantId) => _service.fetchDocument(
      path: FirestorePath.restaurant(restaurantId),
      builder: (data, documentId) => Restaurant.fromJson(data!));

  Future<void> setRestaurant(Restaurant restaurant) => _service.setData(
      path: FirestorePath.restaurant(restaurant.id), data: restaurant.toJson());

  Future<void> setRestaurantDelayed(Restaurant restaurant) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.restaurant(restaurant.id), data: restaurant.toJson()));

  Future<void> setRestaurantError(Restaurant restaurant) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteRestaurant(Restaurant restaurant) =>
      _service.deleteData(path: FirestorePath.restaurant(restaurant.id));
}