import 'restaurant.dart';

/// Encapsulates operations on the list of [Restaurant] returned from Firestore.
class RestaurantCollection {
  RestaurantCollection(restaurants) : _restaurants = restaurants;

  final List<Restaurant> _restaurants;
  
  List<Restaurant> getRestaurants() {
    return _restaurants.toList();
  }

  List<String> getRestaurantNames() {
    return _restaurants.map((data) => data.name).toList();
  }

  Restaurant getRestaurant(String restaurantID) {
    return _restaurants.firstWhere((data) => data.id == restaurantID);
  }
}