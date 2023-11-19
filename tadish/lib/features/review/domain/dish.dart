import '../../picker/domain/restaurant.dart';

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish.freezed.dart';
part 'dish.g.dart';

/// Dish Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class Dish with _$Dish {
  const factory Dish({
    required String id,
    required String restaurantID,
    required String name,
    required double averageStarRating,
    required String numRaters,
    required double averageSweetness,
    required double averageSourness,
    required double averageSaltiness,
    required double averageSpiciness,
    required DateTime createdOn,
    @Default([]) List<String> pictures,
    @Default([]) List<String> publicNotes,
    @Default([]) List<String> tags,
    required String restaurantName,
    // Restaurant? restaurant,
  }) = _Dish;

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Dish>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/dishes.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Dish.fromJson(jsonData)).toList();
  }
}
