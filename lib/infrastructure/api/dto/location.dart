import 'package:equatable/equatable.dart';

class Location with EquatableMixin {
  final int x;
  final int y;
  Location({required this.x, required this.y});

  @override
  List<Object?> get props => [x, y];
}