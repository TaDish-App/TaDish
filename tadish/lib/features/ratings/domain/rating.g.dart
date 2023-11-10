// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      id: json['id'] as String,
      raterID: json['raterID'] as String,
      dishID: json['dishID'] as String,
      starRating: (json['starRating'] as num).toDouble(),
      sweetness: (json['sweetness'] as num?)?.toDouble(),
      sourness: (json['sourness'] as num?)?.toDouble(),
      saltiness: (json['saltiness'] as num?)?.toDouble(),
      spiciness: (json['spiciness'] as num?)?.toDouble(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      picture: json['picture'] as String? ?? '',
      publicNote: json['publicNote'] as String? ?? '',
      privateNote: json['privateNote'] as String? ?? '',
      createdOn: DateTime.parse(json['createdOn'] as String),
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'raterID': instance.raterID,
      'dishID': instance.dishID,
      'starRating': instance.starRating,
      'sweetness': instance.sweetness,
      'sourness': instance.sourness,
      'saltiness': instance.saltiness,
      'spiciness': instance.spiciness,
      'tags': instance.tags,
      'picture': instance.picture,
      'publicNote': instance.publicNote,
      'privateNote': instance.privateNote,
      'createdOn': instance.createdOn.toIso8601String(),
    };
