// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DishImpl _$$DishImplFromJson(Map<String, dynamic> json) => _$DishImpl(
      id: json['id'] as String,
      restaurantID: json['restaurantID'] as String,
      name: json['name'] as String,
      averageStarRating: (json['averageStarRating'] as num).toDouble(),
      numRaters: json['numRaters'] as String,
      averageSweetness: (json['averageSweetness'] as num).toDouble(),
      averageSourness: (json['averageSourness'] as num).toDouble(),
      averageSaltiness: (json['averageSaltiness'] as num).toDouble(),
      averageSpiciness: (json['averageSpiciness'] as num).toDouble(),
      createdOn: DateTime.parse(json['createdOn'] as String),
      pictures: (json['pictures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publicNotes: (json['publicNotes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      restaurantName: json['restaurantName'] as String,
    );

Map<String, dynamic> _$$DishImplToJson(_$DishImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantID': instance.restaurantID,
      'name': instance.name,
      'averageStarRating': instance.averageStarRating,
      'numRaters': instance.numRaters,
      'averageSweetness': instance.averageSweetness,
      'averageSourness': instance.averageSourness,
      'averageSaltiness': instance.averageSaltiness,
      'averageSpiciness': instance.averageSpiciness,
      'createdOn': instance.createdOn.toIso8601String(),
      'pictures': instance.pictures,
      'publicNotes': instance.publicNotes,
      'tags': instance.tags,
      'restaurantName': instance.restaurantName,
    };
