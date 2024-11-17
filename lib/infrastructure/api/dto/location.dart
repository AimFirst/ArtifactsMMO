import 'package:equatable/equatable.dart';

class Location with EquatableMixin {
  final int x;
  final int y;
  Location({required this.x, required this.y});

  Location.empty() : x = 0, y = 0;

  @override
  List<Object?> get props => [x, y];
}