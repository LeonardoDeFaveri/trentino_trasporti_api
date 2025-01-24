import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:trentino_trasporti_api/model/direction/route_info.dart';
import 'package:trentino_trasporti_api/model/direction/stop_info.dart';
import 'package:trentino_trasporti_api/model/direction/utils.dart';
import 'package:trentino_trasporti_api/model/utils.dart';

sealed class TravelMode implements Equatable {
  const TravelMode();

  @override
  bool? get stringify => true;
}

class Walking extends TravelMode {
  @override
  List<Object?> get props => [];
}

class Transit extends TravelMode {
  final StopInfo departureStop;
  final StopInfo arrivalStop;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final int numberOfStops;
  final String headsign;
  final String? tripId;
  final RouteInfo route;
  final TransportType mode;

  const Transit(
      {required this.departureStop,
      required this.arrivalStop,
      required this.departureTime,
      required this.arrivalTime,
      required this.numberOfStops,
      required this.tripId,
      required this.headsign,
      required this.route,
      required this.mode});

  @override
  List<Object?> get props => [
        departureStop,
        arrivalStop,
        departureTime,
        arrivalTime,
        numberOfStops,
        tripId,
        route,
        headsign,
        mode,
      ];

  static Transit fromJson(Map<String, dynamic> json) {
    DateTime arrivalTime = readDateTime(json['arrivalTime']);
    DateTime departureTime = readDateTime(json['departureTime']);
    int numberOfStops = json['numStops'];
    var departureStop = StopInfo(
      name: json['departureStop']['name'],
      location: readLatLng(json['departureStop']['location']),
      id: int.tryParse(json['departureStopId'] ?? ''),
      type: AId.fromId(json['departureStopType'] ?? ''),
    );
    var arrivalStop = StopInfo(
      name: json['arrivalStop']['name'],
      location: readLatLng(json['arrivalStop']['location']),
      id: int.tryParse(json['arrivalStopId'] ?? ''),
      type: AId.fromId(json['arrivalStopType'] ?? ''),
    );
    String colorStr = json['line']['color'] ?? '#000000';
    colorStr = colorStr.substring(1);
    var route = RouteInfo(
      fullName: json['line']['name'],
      shortName: json['line']['shortName'],
      color: Color(int.parse(colorStr, radix: 16)),
    );
    String? tripId = json['tripId'];
    String headsign = json['headsign'];
    String modeString = json['line']['vehicle']['type'];
    TransportType mode;
    if (modeString == 'BUS') {
      mode = TransportType.bus;
    } else if (modeString == 'TRAIN') {
      mode = TransportType.rail;
    } else {
      mode = TransportType.cableway;
    }

    return Transit(
      departureStop: departureStop,
      arrivalStop: arrivalStop,
      departureTime: departureTime,
      arrivalTime: arrivalTime,
      numberOfStops: numberOfStops,
      tripId: tripId,
      route: route,
      headsign: headsign,
      mode: mode,
    );
  }
}
