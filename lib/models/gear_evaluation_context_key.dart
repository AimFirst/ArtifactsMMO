import 'package:dart_mappable/dart_mappable.dart';

part 'gear_evaluation_context_key.mapper.dart';

@MappableClass()
class GearEvaluationContextKey with GearEvaluationContextKeyMappable {
  final int algorithmVersion;
  final String contextType;
  late final String contextSubType;
  final int contextLevel;
  final String optionsHash;

  GearEvaluationContextKey(
      {required this.algorithmVersion,
      required this.contextType,
      required this.contextLevel,
      required this.optionsHash,
      String? contextSubType = null}) {
    this.contextSubType = contextSubType ?? '';
  }
}
