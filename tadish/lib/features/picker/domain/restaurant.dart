import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';

part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  factory Restaurant({
    required String id,
    required String name,
    required String city,
    required String state,
    required String location,
    required DateTime createdOn,
  }) = _Restaurant;
  
  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Restaurant>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/initialData/restaurant.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Restaurant.fromJson(jsonData)).toList();
  }
}