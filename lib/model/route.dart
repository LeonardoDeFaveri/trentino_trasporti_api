import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:format/format.dart';
import 'package:json_annotation/json_annotation.dart';
import 'news.dart';
import 'utils.dart';

part 'route.g.dart';

@JsonSerializable()
class Route implements Equatable {
  final int areaId;
  final List<News> news;
  @JsonKey(
      name: 'routeColor', fromJson: Route._readColor, toJson: Route._writeColor)
  final Color color;
  @JsonKey(name: 'routeId')
  final int id;
  @JsonKey(name: 'routeLongName')
  final String longName;
  @JsonKey(name: 'routeShortName')
  final String shortName;

  /// What kind of means of transportation is used
  final TransportType routeType;
  @JsonKey(name: 'type')
  final AreaType areaType;

  static Color _readColor(String? value) {
    return Color(int.parse(value ?? '000000', radix: 16)).withAlpha(255);
  }

  static String _writeColor(Color value) {
    return format("{:0>2}{:0>2}{:0>2}", value.red.toRadixString(16),
        value.green.toRadixString(16), value.blue.toRadixString(16));
  }

  Route(
      {required this.areaId,
      required this.id,
      required this.longName,
      required this.shortName,
      required this.color,
      required this.routeType,
      required this.areaType,
      required this.news});

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
  Map<String, dynamic> toJson() => _$RouteToJson(this);

  @override
  List<Object?> get props =>
      [areaId, id, longName, shortName, color, routeType, areaType, news];

  @override
  bool? get stringify => true;
}
