import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:trentino_trasporti_api/model/direction/bounds.dart';
import 'package:trentino_trasporti_api/model/direction/step.dart';
import 'package:trentino_trasporti_api/model/direction/utils.dart';

class Way implements Equatable {
  final LatLng departurePointCoords;
  final String departurePointName;
  final LatLng arrivalPointCoords;
  final String arrivalPointName;
  final Bounds bounds;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final Duration duration;

  /// Distance in meters covered by this way
  final int distance;
  final List<Step> steps;

  const Way({
    required this.departurePointCoords,
    required this.departurePointName,
    required this.arrivalPointCoords,
    required this.arrivalPointName,
    required this.bounds,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.distance,
    required this.steps,
  });

  @override
  List<Object?> get props => [
        departurePointCoords,
        departurePointName,
        arrivalPointCoords,
        arrivalPointName,
        departureTime,
        arrivalTime,
        duration
      ];

  @override
  bool? get stringify => true;

  static Way fromJson(Map<String, dynamic> json) {
    Bounds bounds = Bounds.fromJson(json['bounds']);
    Map<String, dynamic> legs = (json['legs'] as List<dynamic>)[0];
    int distance = legs['distance']['inMeters'];
    Duration duration = Duration(
      seconds: legs['duration']['inSeconds'],
    );
    DateTime arrivalTime = readDateTime(legs['arrivalTime']);
    DateTime departureTime = readDateTime(legs['departureTime']);
    String arrivalPointName = legs['endAddress'];
    String departurePointName = legs['startAddress'];
    LatLng arrivalPointCoords = readLatLng(legs['endLocation']);
    LatLng departurePointCoords = readLatLng(legs['startLocation']);
    List<Step> steps = (legs['steps'] as List<dynamic>)
        .map((e) => Step.fromJson(e as Map<String, dynamic>))
        .toList();

    return Way(
      departurePointCoords: departurePointCoords,
      departurePointName: departurePointName,
      arrivalPointCoords: arrivalPointCoords,
      arrivalPointName: arrivalPointName,
      bounds: bounds,
      departureTime: departureTime,
      arrivalTime: arrivalTime,
      duration: duration,
      distance: distance,
      steps: steps,
    );
  }
}
