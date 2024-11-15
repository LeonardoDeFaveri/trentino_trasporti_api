// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopTime _$StopTimeFromJson(Map<String, dynamic> json) => StopTime(
      arrivalTime: StopTime._readTime(json['arrivalTime'] as String),
      departureTime: StopTime._readTime(json['departureTime'] as String),
      stopId: (json['stopId'] as num).toInt(),
      stopSequence: (json['stopSequence'] as num).toInt(),
      tripId: json['tripId'] as String,
      areaType: $enumDecode(_$AreaEnumMap, json['type']),
    );

Map<String, dynamic> _$StopTimeToJson(StopTime instance) => <String, dynamic>{
      'arrivalTime': StopTime._writeTime(instance.arrivalTime),
      'departureTime': StopTime._writeTime(instance.departureTime),
      'stopId': instance.stopId,
      'stopSequence': instance.stopSequence,
      'tripId': instance.tripId,
      'type': _$AreaEnumMap[instance.areaType]!,
    };

const _$AreaEnumMap = {
  AreaType.urban: 'U',
  AreaType.extraurban: 'E',
  AreaType.unknown: 'unknown',
};
