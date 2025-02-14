// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      suggestion: json['suggestion'] as String?,
      district: json['district'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      location: json['location'] as String?,
      lon: (json['lon'] as num?)?.toDouble(),
      state: json['state'] as String?,
      label: json['label'] as String?,
      score: (json['score'] as num?)?.toInt(),
      pincode: (json['pincode'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'suggestion': instance.suggestion,
      'district': instance.district,
      'lat': instance.lat,
      'location': instance.location,
      'lon': instance.lon,
      'state': instance.state,
      'label': instance.label,
      'score': instance.score,
      'pincode': instance.pincode,
    };
