import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'stop_time.dart';
import 'utils.dart';

part 'trip.g.dart';

/// Classed describing a trip of a transportation mean or a trip passing through
/// a stop.
@JsonSerializable()
class Trip implements Equatable {
  @JsonKey(name: 'indiceCorsaInLista')
  final int tripIndex;
  final String tripId;
  final String tripFlag;
  @JsonKey(name: 'tripHeadsign')
  final String tripHeadSign;
  @JsonKey(name: 'corsaPiuVicinaADataRiferimento')
  final bool closestTripToRefDateTime;
  final double delay;
  @JsonKey(name: 'directionId')
  final Direction direction;
  @JsonKey(name: 'lastEventRecivedAt')
  final DateTime? lastUpdate;
  final int lastSequenceDetection;
  @JsonKey(name: 'matricolaBus')
  final int busSerialNumber;
  @JsonKey(name: 'oraArrivoEffettivaAFermataSelezionata')
  final DateTime? effectiveArrivalTimeToSelectedStop;
  @JsonKey(name: 'oraArrivoProgrammatoAFermataSelezionata')
  final DateTime? programmedArrivalTimeToSelectedStop;
  final int routeId;
  @JsonKey(name: 'stopLast')
  final int lastStopId;
  @JsonKey(name: 'stopNext')
  final int nextStopId;
  final List<StopTime> stopTimes;
  @JsonKey(name: 'totaleCorseInLista')
  final int totalAmountOfTrips;
  @JsonKey(name: 'type')
  final AreaType areaType;
  final int wheelchairAccessible;
  // Field ignored for the moment
  //final bool cableway;

  Trip({
    required this.tripIndex,
    required this.tripId,
    required this.tripFlag,
    required this.tripHeadSign,
    required this.closestTripToRefDateTime,
    required this.delay,
    required this.direction,
    required this.lastSequenceDetection,
    required this.busSerialNumber,
    required this.routeId,
    required this.lastStopId,
    required this.nextStopId,
    required this.stopTimes,
    required this.totalAmountOfTrips,
    required this.areaType,
    required this.wheelchairAccessible,
    this.lastUpdate,
    this.effectiveArrivalTimeToSelectedStop,
    this.programmedArrivalTimeToSelectedStop,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
  Map<String, dynamic> toJson() => _$TripToJson(this);

  @override
  List<Object?> get props => [
        tripIndex,
        tripId,
        tripFlag,
        tripHeadSign,
        closestTripToRefDateTime,
        delay,
        direction,
        lastSequenceDetection,
        busSerialNumber,
        routeId,
        lastStopId,
        nextStopId,
        stopTimes,
        totalAmountOfTrips,
        areaType,
        wheelchairAccessible,
        effectiveArrivalTimeToSelectedStop,
        programmedArrivalTimeToSelectedStop
      ];

  @override
  bool? get stringify => true;
}
