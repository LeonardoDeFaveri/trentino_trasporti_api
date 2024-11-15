import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News implements Equatable {
  final int agencyId;
  final String details;
  final String header;
  final String? idFeed;
  final List<int> routeIds;
  final String serviceType;
  @JsonKey(fromJson: News.readDate, toJson: News.writeDate)
  final DateTime startDate;
  @JsonKey(fromJson: News.readDate, toJson: News.writeDate)
  final DateTime endDate;
  final int? stopId;
  final Uri url;

  static DateTime readDate(String value) {
    int secondsFromEpoch = int.parse(value.substring(6, 16));
    return DateTime.fromMillisecondsSinceEpoch(secondsFromEpoch);
  }

  static String writeDate(DateTime value) {
    int secondsSinceEpoch = (value.millisecondsSinceEpoch / 1000) as int;
    return '/Date($secondsSinceEpoch)/';
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
