import 'dart:ui';

import 'package:equatable/equatable.dart';

class RouteInfo implements Equatable {
  final String fullName;
  final String shortName;
  final Color color;

  const RouteInfo({
    required this.fullName,
    required this.shortName,
    required this.color,
  });

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [fullName, shortName, color];
}
