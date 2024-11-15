import 'package:equatable/equatable.dart';
import 'package:format/format.dart';
import 'package:json_annotation/json_annotation.dart';
import 'utils.dart';

part 'stop_time.g.dart';

@JsonSerializable()
class StopTime implements Equatable {
  @JsonKey(fromJson: StopTime._readTime, toJson: StopTime._writeTime)
  final DateTime arrivalTime;
  @JsonKey(fromJson: StopTime._readTime, toJson: StopTime._writeTime)
  final DateTime departureTime;
  final int stopId;
  final int stopSequence;
  final String tripId;
  @JsonKey(name: 'type')
  final AreaType areaType;

  static DateTime _readTime(String value) {
    var now = DateTime.now();
    if (value == '') {
      return now;
    }
    return DateTime.parse(
        format('{:0>4}{:0>2}{:0>2} {}', now.year, now.month, now.day, value));
  }

  static String _writeTime(DateTime value) {
    return '${value.hour}:${value.minute}:${value.second}';
  }

  StopTime(
      {required this.arrivalTime,
      required this.departureTime,
      required this.stopId,
      required this.stopSequence,
      required this.tripId,
      required this.areaType});

  factory StopTime.fromJson(Map<String, dynamic> json) =>
      _$StopTimeFromJson(json);
  Map<String, dynamic> toJson() => _$StopTimeToJson(this);

  @override
  List<Object?> get props =>
      [arrivalTime, departureTime, stopId, stopSequence, tripId, areaType];

  @override
  bool? get stringify => true;
}
