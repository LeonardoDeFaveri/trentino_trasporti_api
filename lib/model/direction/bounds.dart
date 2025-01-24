import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trentino_trasporti_api/model/direction/utils.dart';

part 'bounds.g.dart';

/// A rectangle in geographical coordinates from points at the southwest and
/// northeast corners. Useful for instructing the camera controller of the map
/// viewer.
@JsonSerializable(createToJson: false)
class Bounds implements Equatable {
  @JsonKey(name: 'northeast', fromJson: readLatLng)
  final LatLng northEast;
  @JsonKey(name: 'southwest', fromJson: readLatLng)
  final LatLng southWest;

  const Bounds({required this.northEast, required this.southWest});

  static Bounds fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);

  @override
  List<Object?> get props => [northEast, southWest];

  @override
  bool? get stringify => true;
}
