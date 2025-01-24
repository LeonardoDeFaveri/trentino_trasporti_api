import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:trentino_trasporti_api/model/direction/travel.dart';
import 'package:trentino_trasporti_api/model/direction/utils.dart';

class Step implements Equatable {
  final LatLng startLocation;
  final LatLng endLocation;
  final TravelMode travelMode;
  final int distance;
  final Duration duration;

  const Step({
    required this.startLocation,
    required this.endLocation,
    required this.travelMode,
    required this.distance,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        startLocation,
        endLocation,
        travelMode,
        distance,
        duration,
      ];

  @override
  bool? get stringify => true;

  static Step fromJson(Map<String, dynamic> json) {
    LatLng startLocation = readLatLng(json['startLocation']);
    LatLng endLocation = readLatLng(json['endLocation']);
    int distance = json['distance']['inMeters'];
    Duration duration = Duration(
      seconds: json['duration']['inSeconds'],
    );

    String travelModeString = json['travelMode'];
    TravelMode travelMode;

    if (travelModeString == 'WALKING') {
      travelMode = Walking();
    } else {
      travelMode = Transit.fromJson(json['transitDetails']);
    }

    return Step(
      startLocation: startLocation,
      endLocation: endLocation,
      travelMode: travelMode,
      distance: distance,
      duration: duration,
    );
  }
}
