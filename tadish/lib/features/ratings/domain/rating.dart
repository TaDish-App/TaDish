import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

/// Rating Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class Rating with _$Rating {
  const factory Rating({
    required String id,
    required String raterID,
    required String dishID,
    required double starRating,
    double? sweetness,
    double? sourness,
    double? saltiness,
    double? spiciness,
    @Default([]) List<String>? tags,
    @Default('') String? picture,
    @Default('') String? publicNote,
    @Default('') String? privateNote,
    required DateTime createdOn,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Rating>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/ratings.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Rating.fromJson(jsonData)).toList();
  }
}