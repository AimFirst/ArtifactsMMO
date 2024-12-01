import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/presentation/base_model.dart';
import 'package:equatable/equatable.dart';

// Unassisted Process Algorithm
sealed class TargetBasedUpaModel implements BaseModel {}

class TargetBasedUpaModelLoading with EquatableMixin implements TargetBasedUpaModel {
  @override
  List<Object?> get props => [];

}

class TargetBasedUpaModelError with EquatableMixin implements TargetBasedUpaModel {
  final String error;

  TargetBasedUpaModelError({required this.error});

  @override
  List<Object?> get props => [error];
}

class TargetBasedUpaModelLoaded with EquatableMixin implements TargetBasedUpaModel {
  final State state;

  TargetBasedUpaModelLoaded({required this.state});

  @override
  List<Object?> get props => [state];
}
