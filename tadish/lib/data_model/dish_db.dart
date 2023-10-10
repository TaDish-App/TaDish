import 'package:flutter/material.dart';

class DishData {
  DishData(
      {required this.id,
        required this.restaurantID,
        required this.name,
        required this.cost,
        required this.averageStarRating,
        required this.numRaters,
        required this.averageSweetness,
        required this.averageSourness,
        required this.averageSaltiness,
        required this.averageSpiciness,
        required this.createdBy,
        List<String>? pictures,
        List<String>? publicNotes,
        List<String>? tags})
      : pictures = pictures ?? [],
        publicNotes = publicNotes ?? [],
        tags = tags ?? [];
    String id;
    String restaurantID;
    String name;
    String cost;
    double averageStarRating;
    String numRaters;
    double averageSweetness;
    double averageSourness;
    double averageSaltiness;
    double averageSpiciness;
    String createdBy;
    List<String> pictures;
    List<String> publicNotes;
    List<String> tags;
}

class DishDB {
  final List<DishData> _dishes = [
    DishData(
        id: 'dish-001',
        restaurantID: '1',
        name: 'Tiramisu',
        cost: '7.00',
        averageStarRating: 4,
        numRaters: '2',
        averageSweetness: 80.0,
        averageSourness: 00.0,
        averageSaltiness: 10.0,
        averageSpiciness: 00.0,
        createdBy: '10/10/23',
        pictures: ['assets/images/1.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
    DishData(
        id: 'dish-002',
        restaurantID: '1',
        name: 'Flan',
        cost: '5.00',
        averageStarRating: 4,
        numRaters: '6',
        averageSweetness: 70.0,
        averageSourness: 10.0,
        averageSaltiness: 10.0,
        averageSpiciness: 00.0,
        createdBy: '10/10/23',
        pictures: ['assets/images/2.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
    DishData(
        id: 'dish-003',
        restaurantID: '2',
        name: 'Crème Brûlée',
        cost: '8.50',
        averageStarRating: 5,
        numRaters: '5',
        averageSweetness: 80.0,
        averageSourness: 00.0,
        averageSaltiness: 20.0,
        averageSpiciness: 00.0,
        createdBy: '10/10/23',
        pictures: ['assets/images/3.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
    DishData(
        id: 'dish-004',
        restaurantID: '1',
        name: 'Panna Cotta',
        cost: '12.50',
        averageStarRating: 3,
        numRaters: '1',
        averageSweetness: 60.0,
        averageSourness: 00.0,
        averageSaltiness: 20.0,
        averageSpiciness: 00.0,
        createdBy: '10/10/23',
        pictures: ['assets/images/4.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
    DishData(
        id: 'dish-005',
        restaurantID: '1',
        name: 'Yogurt Parfait',
        cost: '3.50',
        averageStarRating: 5,
        numRaters: '20',
        averageSweetness: 80.0,
        averageSourness: 00.0,
        averageSaltiness: 20.0,
        averageSpiciness: 00.0,
        createdBy: '10/10/23',
        pictures: ['assets/images/5.jpg'],
        publicNotes: ['taste very sweet'],
        tags: ['local']),
  ];

  List<DishData> getDishes() {
    return _dishes.toList();
  }
}

DishDB dishDB = DishDB();