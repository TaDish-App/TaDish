import '../../picker/domain/restaurant.dart';
import 'dish.dart';

/// Encapsulates operations on the list of [Dish] returned from Firestore.
class DishCollection {
  DishCollection(dishes) : _dishes = dishes;

  final List<Dish> _dishes;

  Dish getDish(String dishID) {
    return _dishes.firstWhere((data) => data.id == dishID);
  }

  int size() {
    return _dishes.length;
  }

  List<String> getDishIDs() {
    return _dishes.map((data) => data.id).toList();
  }

  List<Dish> getDishes() {
    return _dishes.toList();
  }

  List<Dish> getDishRestaurant() {
    List<Dish> dishes = _dishes.toList();
    return dishes;
  }

  String getDishID(String dishName) {
    return _dishes.singleWhere((dish) => dish.name == dishName).id;
  }

  int getSize() {
    return _dishes.length;
  }

  String getDishName(String dishID) {
    return _dishes.singleWhere((dish) => dish.id == dishID).name;
  }

  String getDishRestaurantName(String dishID) {
    return "getDishRestaurantName()";
    // List<Dish> dishes = getDishRestaurant();
    // RestaurantData? restaurantData = dishes.singleWhere((dish) => dish.id == dishID).restaurant;
    // return restaurantData == null ? "default" : restaurantData.name;
  }


}
