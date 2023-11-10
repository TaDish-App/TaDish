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
      tastePreference: (json['tastePreference'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      friendsIDList: (json['friendsIDList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      savedDishesID: (json['savedDishesID'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      taggedDishes: json['taggedDishes'] as int?,
      geolocation: json['geolocation'] as String?,
      role: json['role'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int?,
      ethnicity: json['ethnicity'] as String?,
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
      updatedOn: json['updatedOn'] == null
          ? null
          : DateTime.parse(json['updatedOn'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'tastePreference': instance.tastePreference,
      'friendsIDList': instance.friendsIDList,
      'savedDishesID': instance.savedDishesID,
      'taggedDishes': instance.taggedDishes,
      'geolocation': instance.geolocation,
      'role': instance.role,
      'gender': instance.gender,
      'age': instance.age,
      'ethnicity': instance.ethnicity,
      'createdOn': instance.createdOn?.toIso8601String(),
      'updatedOn': instance.updatedOn?.toIso8601String(),
    };
