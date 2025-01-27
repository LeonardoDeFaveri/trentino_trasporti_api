import 'package:latlong2/latlong.dart';

LatLng readLatLng(Map<String, dynamic> json) {
  double lat = json['lat'];
  double lng = json['lng'];
  return LatLng(lat, lng);
}

DateTime? readDateTime(Map<String, dynamic>? json) {
  if (json == null) {
    return null;
  }

  int year = json['yearOfEra'];
  int month = json['monthOfYear'];
  int day = json['dayOfMonth'];
  int hour = json['hourOfDay'];
  int minute = json['minuteOfHour'];
  int second = json['secondOfMinute'];
  return DateTime(year, month, day, hour, minute, second);
}
