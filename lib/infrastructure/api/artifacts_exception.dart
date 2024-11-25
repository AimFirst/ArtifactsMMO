import 'dart:io';

import 'package:equatable/equatable.dart';

class ArtifactsException with EquatableMixin implements Exception {
  final String errorMessage;
  ArtifactsException({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}