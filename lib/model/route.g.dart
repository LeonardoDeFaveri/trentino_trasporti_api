// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      areaId: (json['areaId'] as num).toInt(),
      id: (json['routeId'] as num).toInt(),
      longName: json['routeLongName'] as String,
      shortName: json['routeShortName'] as String,
      color: Route._readColor(json['routeColor']),
      routeType: $enumDecode(_$RouteTypeEnumMap, json['routeType']),
      areaType: $enumDecode(_$AreaEnumMap, json['type']),
      news: ((json['news'] ?? List.empty()) as List<dynamic>)
          .map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'areaId': instance.areaId,
      'news': instance.news,
      'routeColor': Route._writeColor(instance.color),
      'routeId': instance.id,
      'routeLongName': instance.longName,
      'routeShortName': instance.shortName,
      'routeType': _$RouteTypeEnumMap[instance.routeType]!,
      'type': _$AreaEnumMap[instance.areaType]!,
    };

const _$RouteTypeEnumMap = {
  TransportType.unknown: 'unknown',
  TransportType.rail: 2,
  TransportType.bus: 3,
  TransportType.cableway: 5,
};

const _$AreaEnumMap = {
  AreaType.urban: 'U',
  AreaType.extraurban: 'E',
  AreaType.unknown: 'unknown',
};
