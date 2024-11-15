import 'package:json_annotation/json_annotation.dart';

enum AreaType {
  @JsonValue('U')
  urban,
  @JsonValue('E')
  extraurban,
  unknown
}

extension AId on AreaType {
  static AreaType fromId(String id) {
    return switch (id) {
      'E' => AreaType.extraurban,
      'U' => AreaType.urban,
      _ => AreaType.unknown
    };
  }

  String get id {
    return switch (this) {
      AreaType.urban => 'U',
      AreaType.extraurban => 'E',
      AreaType.unknown => '-'
    };
  }
}

enum Direction {
  both,
  @JsonValue(0)
  forward,
  @JsonValue(1)
  backward
}

extension DId on Direction {
  static Direction fromId(int? id) {
    return switch (id) {
      0 => Direction.forward,
      1 => Direction.backward,
      _ => Direction.both
    };
  }

  int? get id {
    return switch (this) {
      Direction.forward => 0,
      Direction.backward => 1,
      Direction.both => null
    };
  }
}

enum TransportType {
  unknown,
  @JsonValue(2)
  rail,
  @JsonValue(3)
  bus,
  @JsonValue(5)
  cableway
}

extension TTId on TransportType {
  int get id {
    return switch (this) {
      TransportType.rail => 2,
      TransportType.bus => 3,
      TransportType.cableway => 5,
      TransportType.unknown => 0
    };
  }
}
