import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:trentino_trasporti_api/model/model.dart';

class StopInfo implements Equatable {
  final String name;
  final LatLng location;
  final int? id;
  final AreaType type;

  const StopInfo({
    required this.name,
    required this.location,
    required this.id,
    required this.type,
  });

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [id, type, location, name];
}
