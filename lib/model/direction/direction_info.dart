import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:trentino_trasporti_api/model/direction/way.dart';

const defaultLatLng = LatLng(0, 0);

class DirectionInfo implements Equatable {
  final LatLng departurePoint;
  final LatLng arrivalPoint;

  /// An arrays of the possible ways to go from the `departurePoint` to the
  /// `arrivalPoint`.
  final List<Way> ways;

  const DirectionInfo({
    required this.ways,
    LatLng? departurePoint,
    LatLng? arrivalPoint,
  })  : departurePoint = departurePoint ?? defaultLatLng,
        arrivalPoint = arrivalPoint ?? defaultLatLng;

  static DirectionInfo fromJson(
      Map<String, dynamic> json, LatLng from, LatLng to) {
    List<Way> ways = (json['routes'] as List<dynamic>)
        .map((e) => Way.fromJson(e as Map<String, dynamic>))
        .toList();
    return DirectionInfo(ways: ways, departurePoint: from, arrivalPoint: to);
  }

  @override
  List<Object?> get props => [departurePoint, arrivalPoint];

  @override
  bool? get stringify => true;
}
