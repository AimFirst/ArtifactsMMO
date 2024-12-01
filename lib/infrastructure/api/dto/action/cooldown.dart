import 'package:artifacts_api/artifacts_api.dart';
import 'package:equatable/equatable.dart';

class Cooldown with EquatableMixin {
  final int totalSeconds;
  final int remainingSeconds;
  final DateTime startedAt;
  final DateTime expiration;
  final ActionType reason;

  Cooldown({
    required this.totalSeconds,
    required this.remainingSeconds,
    required this.startedAt,
    required this.expiration,
    required this.reason,
  });

  @override
  List<Object?> get props => [
        totalSeconds,
        remainingSeconds,
        startedAt,
        expiration,
        reason,
      ];
}
