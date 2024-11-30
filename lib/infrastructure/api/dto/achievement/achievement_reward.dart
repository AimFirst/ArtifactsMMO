import 'package:equatable/equatable.dart';

class AchievementReward with EquatableMixin {
  final int gold;

  AchievementReward({required this.gold});

  @override
  List<Object?> get props => [gold];
}