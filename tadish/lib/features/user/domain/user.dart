import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String username,
    required String email,
    required List<double> tastePreference,
    required List<String> friendsIDList,
    required List<String> savedDishesID,
    String? geolocation,
    required String role,
    required String gender,
    int? age,
    String? ethnicity,
    required DateTime createdOn,
    required DateTime updatedOn,
    required bool isActive,
    required int taggedDishes,
  }) = _User;
  
  const User._();
  
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<User>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/initialData/users.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => User.fromJson(jsonData)).toList();
  }
}