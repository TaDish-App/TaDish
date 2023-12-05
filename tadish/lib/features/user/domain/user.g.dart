// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int,
      ethnicity: json['ethnicity'] as String,
      geolocation: json['geolocation'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
      updatedOn: DateTime.parse(json['updatedOn'] as String),
      tastePreference: (json['tastePreference'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      friendsIDList: (json['friendsIDList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      savedDishesID: (json['savedDishesID'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      role: json['role'] as String? ?? 'user',
      isActive: json['isActive'] as bool? ?? true,
      taggedDishes: json['taggedDishes'] as int? ?? 0,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'gender': instance.gender,
      'age': instance.age,
      'ethnicity': instance.ethnicity,
      'geolocation': instance.geolocation,
      'createdOn': instance.createdOn.toIso8601String(),
      'updatedOn': instance.updatedOn.toIso8601String(),
      'tastePreference': instance.tastePreference,
      'friendsIDList': instance.friendsIDList,
      'savedDishesID': instance.savedDishesID,
      'role': instance.role,
      'isActive': instance.isActive,
      'taggedDishes': instance.taggedDishes,
    };
