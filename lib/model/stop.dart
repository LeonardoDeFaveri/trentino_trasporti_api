import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'route.dart';
import 'utils.dart';

part 'stop.g.dart';

@JsonSerializable()
class Stop implements Equatable {
  final double? distance;
  final List<Route> routes;
  @JsonKey(name: 'stopCode')
  final String code;
  @JsonKey(name: 'stopName')
  final String name;
  @JsonKey(name: 'stopDesc')
  final String description;
  @JsonKey(name: 'stopId')
  final int id;
  @JsonKey(name: 'stopLat')
  final double latitude;
  @JsonKey(name: 'stopLon')
  final double longitude;
  @JsonKey(name: 'stopLevel')
  final int level;
  @JsonKey(defaultValue: '')
  final String street;
  @JsonKey(defaultValue: '')
  final String town;
  @JsonKey(name: 'type')
  final AreaType areaType;
  final int wheelchairBoarding;

  Stop(
      {required this.routes,
      required this.code,
      required this.name,
      required this.description,
      required this.id,
      required this.latitude,
      required this.longitude,
      required this.level,
      required this.street,
      required this.town,
      required this.areaType,
      required this.wheelchairBoarding,
      this.distance});

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
  Map<String, dynamic> toJson() => _$StopToJson(this);

  @override
  List<Object?> get props => [
        routes,
        code,
        name,
        description,
        id,
        latitude,
        longitude,
        level,
        street,
        town,
        areaType,
        wheelchairBoarding,
        distance
      ];

  @override
  bool? get stringify => true;
}
