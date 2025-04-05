// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stop _$StopFromJson(Map<String, dynamic> json) => Stop(
      routes: (json['routes'] as List<dynamic>)
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['stopCode'] as String,
      name: json['stopName'] as String,
      description: json['stopDesc'] as String,
      id: (json['stopId'] as num).toInt(),
      latitude: (json['stopLat'] as num).toDouble(),
      longitude: (json['stopLon'] as num).toDouble(),
      level: (json['stopLevel'] as num).toInt(),
      street: json['street'] as String? ?? '',
      town: json['town'] as String? ?? '',
      areaType: $enumDecode(_$AreaTypeEnumMap, json['type']),
      wheelchairBoarding: (json['wheelchairBoarding'] as num).toInt(),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StopToJson(Stop instance) => <String, dynamic>{
      'distance': instance.distance,
      'routes': instance.routes,
      'stopCode': instance.code,
      'stopName': instance.name,
      'stopDesc': instance.description,
      'stopId': instance.id,
      'stopLat': instance.latitude,
      'stopLon': instance.longitude,
      'stopLevel': instance.level,
      'street': instance.street,
      'town': instance.town,
      'type': _$AreaTypeEnumMap[instance.areaType]!,
      'wheelchairBoarding': instance.wheelchairBoarding,
    };

const _$AreaTypeEnumMap = {
  AreaType.urban: 'U',
  AreaType.extraurban: 'E',
  AreaType.unknown: 'unknown',
};
