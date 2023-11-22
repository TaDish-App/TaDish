// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      id: json['id'] as String,
      raterEmail: json['raterEmail'] as String,
      dishID: json['dishID'] as String,
      starRating: (json['starRating'] as num).toDouble(),
      restaurantName: json['restaurantName'] as String,
      sweetness: (json['sweetness'] as num?)?.toDouble(),
      sourness: (json['sourness'] as num?)?.toDouble(),
      saltiness: (json['saltiness'] as num?)?.toDouble(),
      spiciness: (json['spiciness'] as num?)?.toDouble(),
      createdOn: json['createdOn'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      picture: json['picture'] as String? ?? '',
      publicNote: json['publicNote'] as String? ?? '',
      privateNote: json['privateNote'] as String? ?? '',
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'raterEmail': instance.raterEmail,
      'dishID': instance.dishID,
      'starRating': instance.starRating,
      'restaurantName': instance.restaurantName,
      'sweetness': instance.sweetness,
      'sourness': instance.sourness,
      'saltiness': instance.saltiness,
      'spiciness': instance.spiciness,
      'createdOn': instance.createdOn,
      'tags': instance.tags,
      'picture': instance.picture,
      'publicNote': instance.publicNote,
      'privateNote': instance.privateNote,
    };
