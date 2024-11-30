import 'package:equatable/equatable.dart';

class Effect with EquatableMixin {
  final String name;
  final int value;

  Effect({
    required this.name,
    required this.value,
  });

  @override
  List<Object?> get props => [
        name,
        value,
      ];
}
