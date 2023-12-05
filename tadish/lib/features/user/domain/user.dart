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
    required String gender,
    required int age,
    required String ethnicity,
    required String geolocation,
    required DateTime createdOn,
    required DateTime updatedOn,
    required List<double> tastePreference,
    @Default([]) List<String> friendsIDList,
    @Default([]) List<String> savedDishesID,
    @Default('user') String role,
    @Default(true) bool isActive,
    @Default(0) int taggedDishes,
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