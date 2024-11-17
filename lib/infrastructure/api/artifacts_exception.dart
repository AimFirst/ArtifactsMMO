import 'dart:io';

import 'package:equatable/equatable.dart';

class ArtifactsExceptions with EquatableMixin implements Exception {
  final String errorMessage;
  ArtifactsExceptions({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}