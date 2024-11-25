import 'dart:math';

import 'package:equatable/equatable.dart';

class Location with EquatableMixin {
  final int x;
  final int y;
  Location({required this.x, required this.y});

  Location.empty() : x = 0, y = 0;

  @override
  List<Object?> get props => [x, y];

  @override
  String toString() {
    return '$x , $y';
  }

  double distance(Location other) {
    return sqrt(pow(other.x - x, 2) + pow(other.y -y, 2));
  }
}