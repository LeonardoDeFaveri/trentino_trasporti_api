// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bounds _$BoundsFromJson(Map<String, dynamic> json) => Bounds(
      northEast: readLatLng(json['northeast'] as Map<String, dynamic>),
      southWest: readLatLng(json['southwest'] as Map<String, dynamic>),
    );
