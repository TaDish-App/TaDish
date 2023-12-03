import 'restaurant.dart';

/// Encapsulates operations on the list of [Restaurant] returned from Firestore.
class RestaurantCollection {
  RestaurantCollection(restaurants) : _restaurants = restaurants;

  final List<Restaurant> _restaurants;

  List<Restaurant> getRestaurants() {
    return _restaurants.toList();
  }

  int size() {
    return _restaurants.length;
  }

  List<String> getRestaurantNames() {
    return _restaurants.map((data) => data.name).toList();
  }

  String getRestaurantIdIfExists(restaurantName) {
    try {
      return _restaurants.firstWhere((data) => data.name == restaurantName).id;
    } on StateError catch (_, e) {
      return "";
    }
  }

  Restaurant getRestaurant(String restaurantID) {
    return _restaurants.firstWhere((data) => data.id == restaurantID);
  }
}
