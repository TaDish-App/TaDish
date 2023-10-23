import 'restaurant_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DishData {
  DishData(
      {required this.id,
        required this.restaurantID,
        required this.name,
        required this.averageStarRating,
        required this.numRaters,
        required this.averageSweetness,
        required this.averageSourness,
        required this.averageSaltiness,
        required this.averageSpiciness,
        required this.createdOn,
        List<String>? pictures,
        List<String>? publicNotes,
        List<String>? tags,
        RestaurantData? restaurant})
      : pictures = pictures ?? [],
        publicNotes = publicNotes ?? [],
        tags = tags ?? [];
    String id;
    String restaurantID;
    String name;
    double averageStarRating;
    String numRaters;
    double averageSweetness;
    double averageSourness;
    double averageSaltiness;
    double averageSpiciness;
    DateTime createdOn;
    List<String> pictures;
    List<String> publicNotes;
    List<String> tags;
    RestaurantData? restaurant;
}

class DishDB {
  DishDB(this.ref);

  final ProviderRef<DishDB> ref;

  final List<DishData> _dishes = [
    DishData(
        id: 'dish-001',
        restaurantID: 'restaurant-001',
        name: 'Tiramisu',
        averageStarRating: 4,
        numRaters: '2',
        averageSweetness: 80.0,
        averageSourness: 00.0,
        averageSaltiness: 10.0,
        averageSpiciness: 00.0,
        createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
        pictures: ['assets/images/1.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
    DishData(
        id: 'dish-002',
        restaurantID: 'restaurant-001',
        name: 'Flan',
        averageStarRating: 4,
        numRaters: '6',
        averageSweetness: 70.0,
        averageSourness: 10.0,
        averageSaltiness: 10.0,
        averageSpiciness: 00.0,
        createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
        pictures: ['assets/images/2.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
    DishData(
        id: 'dish-003',
        restaurantID: 'restaurant-004',
        name: 'Crème Brûlée',
        averageStarRating: 5,
        numRaters: '5',
        averageSweetness: 80.0,
        averageSourness: 00.0,
        averageSaltiness: 20.0,
        averageSpiciness: 00.0,
        createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
        pictures: ['assets/images/3.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
    DishData(
        id: 'dish-004',
        restaurantID: 'restaurant-006',
        name: 'Panna Cotta',
        averageStarRating: 3,
        numRaters: '1',
        averageSweetness: 60.0,
        averageSourness: 00.0,
        averageSaltiness: 20.0,
        averageSpiciness: 00.0,
        createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
        pictures: ['assets/images/4.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
    DishData(
        id: 'dish-005',
        restaurantID: 'restaurant-005',
        name: 'Yogurt Parfait',
        averageStarRating: 5,
        numRaters: '20',
        averageSweetness: 80.0,
        averageSourness: 00.0,
        averageSaltiness: 20.0,
        averageSpiciness: 00.0,
        createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
        pictures: ['assets/images/5.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
  ];

  List<DishData> getDishes() {
    return _dishes.toList();
  }
  List<DishData> getDishRestaurant() {
    List<DishData> dishes = _dishes.toList();
    RestaurantDB restaurantDB = ref.read(restaurantDBProvider);
    for (var dish in dishes) {
      RestaurantData restaurant = restaurantDB.getRestaurant(dish.restaurantID);
      dish.restaurant = restaurant;
    }
    return dishes;
  }

  String getDishName(String dishID) {
    return _dishes.singleWhere((dish) => dish.id == dishID).name;
  }

  String getDishRestaurantName(String dishID) {
    return _dishes.singleWhere((dish) => dish.id == dishID).restaurant!.name;
  }
}

final dishDBProvider = Provider<DishDB>((ref) {
  return DishDB(ref);
});
