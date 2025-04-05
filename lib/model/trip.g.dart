// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      tripIndex: (json['indiceCorsaInLista'] as num).toInt(),
      tripId: json['tripId'] as String,
      tripFlag: json['tripFlag'] as String? ?? '',
      tripHeadSign: json['tripHeadsign'] as String? ?? '',
      closestTripToRefDateTime: json['corsaPiuVicinaADataRiferimento'] as bool,
      delay: (json['delay'] as num?)?.toDouble() ?? 0.0,
      direction: $enumDecode(_$DirectionEnumMap, json['directionId']),
      lastSequenceDetection:
          (json['lastSequenceDetection'] as num?)?.toInt() ?? 0,
      busSerialNumber: (json['matricolaBus'] as num?)?.toInt() ?? 0,
      routeId: (json['routeId'] as num).toInt(),
      lastStopId: (json['stopLast'] as num).toInt(),
      nextStopId: (json['stopNext'] as num).toInt(),
      stopTimes: (json['stopTimes'] as List<dynamic>?)
              ?.map((e) => StopTime.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalAmountOfTrips: (json['totaleCorseInLista'] as num?)?.toInt() ?? 0,
      areaType: $enumDecode(_$AreaTypeEnumMap, json['type']),
      wheelchairAccessible:
          (json['wheelchairAccessible'] as num?)?.toInt() ?? 0,
      lastUpdate: json['lastEventRecivedAt'] == null
          ? null
          : DateTime.parse(json['lastEventRecivedAt'] as String),
      effectiveArrivalTimeToSelectedStop:
          json['oraArrivoEffettivaAFermataSelezionata'] == null
              ? null
              : DateTime.parse(
                  json['oraArrivoEffettivaAFermataSelezionata'] as String),
      programmedArrivalTimeToSelectedStop:
          json['oraArrivoProgrammatoAFermataSelezionata'] == null
              ? null
              : DateTime.parse(
                  json['oraArrivoProgrammatoAFermataSelezionata'] as String),
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'indiceCorsaInLista': instance.tripIndex,
      'tripId': instance.tripId,
      'tripFlag': instance.tripFlag,
      'tripHeadsign': instance.tripHeadSign,
      'corsaPiuVicinaADataRiferimento': instance.closestTripToRefDateTime,
      'delay': instance.delay,
      'directionId': _$DirectionEnumMap[instance.direction]!,
      'lastEventRecivedAt': instance.lastUpdate?.toIso8601String(),
      'lastSequenceDetection': instance.lastSequenceDetection,
      'matricolaBus': instance.busSerialNumber,
      'oraArrivoEffettivaAFermataSelezionata':
          instance.effectiveArrivalTimeToSelectedStop?.toIso8601String(),
      'oraArrivoProgrammatoAFermataSelezionata':
          instance.programmedArrivalTimeToSelectedStop?.toIso8601String(),
      'routeId': instance.routeId,
      'stopLast': instance.lastStopId,
      'stopNext': instance.nextStopId,
      'stopTimes': instance.stopTimes,
      'totaleCorseInLista': instance.totalAmountOfTrips,
      'type': _$AreaTypeEnumMap[instance.areaType]!,
      'wheelchairAccessible': instance.wheelchairAccessible,
    };

const _$DirectionEnumMap = {
  Direction.both: 'both',
  Direction.forward: 0,
  Direction.backward: 1,
};

const _$AreaTypeEnumMap = {
  AreaType.urban: 'U',
  AreaType.extraurban: 'E',
  AreaType.unknown: 'unknown',
};
