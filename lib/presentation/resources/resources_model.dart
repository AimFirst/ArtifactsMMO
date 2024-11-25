import 'package:artifacts_mmo/infrastructure/api/dto/resource.dart';
import 'package:artifacts_mmo/presentation/base_model.dart';
import 'package:equatable/equatable.dart';

sealed class ResourcesModel implements BaseModel {}

class ResourcesModelLoading with EquatableMixin implements ResourcesModel {
  @override
  List<Object?> get props => [];

}

class ResourcesModelError with EquatableMixin implements ResourcesModel {
  final String error;

  ResourcesModelError({required this.error});

  @override
  List<Object?> get props => [error];
}

class ResourcesModelLoaded with EquatableMixin implements ResourcesModel {
  final List<Resource> resources;

  ResourcesModelLoaded({required this.resources});

  @override
  List<Object?> get props => [resources];
}
