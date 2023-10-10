class RestaurantData {
  RestaurantData({required this.id,
    required this.name,
    required this.city,
    required this.state,
    required this.location,
    required this.createdOn});

  String id;
  String name;
  String city;
  String state;
  String location;
  DateTime createdOn;
}

class RestaurantDB {
  final List<RestaurantData> _restaurant = [
  RestaurantData(
        id: 'restaurant-001',
        name: 'Chong Qing Hot Pot',
        city: 'Honolulu',
        state: 'Hawaii',
        location: '2500 Campus Rd, Honolulu, HI 96822',
        createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
    ),
    RestaurantData(
      id: 'restaurant-002',
      name: 'HiTEA',
      city: 'Honolulu',
      state: 'Hawaii',
      location: '2500 Campus Rd, Honolulu, HI 96822',
      createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
    ),
    RestaurantData(
      id: 'restaurant-003',
      name: 'Golden Pork',
      city: 'Honolulu',
      state: 'Hawaii',
      location: '2500 Campus Rd, Honolulu, HI 96822',
      createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
    ),
    RestaurantData(
      id: 'restaurant-004',
      name: 'Ruscello',
      city: 'Honolulu',
      state: 'Hawaii',
      location: '2500 Campus Rd, Honolulu, HI 96822',
      createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
    ),
    RestaurantData(
      id: 'restaurant-005',
      name: 'Gyu-Kaku',
      city: 'Honolulu',
      state: 'Hawaii',
      location: '2500 Campus Rd, Honolulu, HI 96822',
      createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
    ),
    RestaurantData(
      id: 'restaurant-006',
      name: 'Gometei',
      city: 'Honolulu',
      state: 'Hawaii',
      location: '2500 Campus Rd, Honolulu, HI 96822',
      createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
    ),
    RestaurantData(
      id: 'restaurant-007',
      name: 'Nicos Pier 38',
      city: 'Honolulu',
      state: 'Hawaii',
      location: '2500 Campus Rd, Honolulu, HI 96822',
      createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
    ),
    RestaurantData(
      id: 'restaurant-008',
      name: 'Ginza Sushi',
      city: 'Honolulu',
      state: 'Hawaii',
      location: '2500 Campus Rd, Honolulu, HI 96822',
      createdOn: DateTime.parse('2023-07-20 20:18:04Z'),
    ),
  ];

  List<RestaurantData> getRestaurants() {
    return _restaurant.toList();
  }

  List<String> getRestaurantNames() {
    return _restaurant.map((data) => data.name).toList();
  }

  RestaurantData getRestaurant(String restaurantID) {
    return _restaurant.firstWhere((data) => data.id == restaurantID);
  }
}

RestaurantDB restaurantDB = RestaurantDB();