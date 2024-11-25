import 'package:artifacts_mmo/infrastructure/api/dto/character.dart';
import 'package:artifacts_mmo/presentation/base_model.dart';
import 'package:equatable/equatable.dart';

sealed class StatusModel implements BaseModel {}

class StatusModelLoading with EquatableMixin implements StatusModel {
  @override
  List<Object?> get props => [];

}

class StatusModelError with EquatableMixin implements StatusModel {
  final String error;

  StatusModelError({required this.error});

  @override
  List<Object?> get props => [error];
}

class StatusModelLoaded with EquatableMixin implements StatusModel {
  final Character character;

  StatusModelLoaded({required this.character});

  @override
  List<Object?> get props => [character];
}
