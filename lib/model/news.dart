import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News implements Equatable {
  final String agencyId;
  final String details;
  final String header;
  final int? idFeed;
  @JsonKey(name: 'RouteIds', readValue: News.readRouteIds, toJson: News.writeRouteIds)
  final List<int> routeIds;
  final String serviceType;
  @JsonKey(fromJson: News.readDate, toJson: News.writeDate)
  final DateTime startDate;
  @JsonKey(fromJson: News.readDate, toJson: News.writeDate)
  final DateTime endDate;
  @JsonKey(fromJson: News.readStopId)
  final int? stopId;
  final Uri url;

  static DateTime readDate(String value) {
    return DateTime.parse(value);
  }

  static String writeDate(DateTime value) {
    return value.toIso8601String();
  }

  static int? readStopId(Object value) {
    if (value is int) {
      return value;
    } else {
      return null;
    }
  }

  static List<int> readRouteIds(Map<dynamic, dynamic> json, String field) {
    Object? routeId = json['routeId'];
    if (routeId != null && routeId is int) {
      return [routeId];
    }

    Object routeIds = json['routeIds'];
    if (routeIds is String) {
      return routeIds.split(',').fold<List<int>>([], (ids, id) {
        ids.add(int.parse(id));
        return ids;
      });
    }

    return [];
  }

  static String writeRouteIds(List<int> value) {
    return value.join(',');
  }

  News(
      {required this.agencyId,
      required this.details,
      required this.header,
      required this.routeIds,
      required this.serviceType,
      required this.startDate,
      required this.endDate,
      required this.url,
      this.stopId,
      this.idFeed});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);

  @override
  List<Object?> get props => [
        agencyId,
        details,
        header,
        routeIds,
        serviceType,
        startDate,
        endDate,
        url,
        stopId,
        idFeed
      ];

  @override
  bool? get stringify => true;
}
