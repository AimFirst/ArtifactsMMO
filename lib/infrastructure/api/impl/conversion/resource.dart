import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/drop.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/skill.dart';

extension ResourceConversion on ResourceSchema {
  Resource convert() {
    return Resource(
      name: name,
      code: code,
      skillType: skill.convert(),
      skillLevel: level,
      drops: drops.map((d) => d.convert()).toList(),
    );
  }
}
