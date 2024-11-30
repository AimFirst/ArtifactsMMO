import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/craft/craft.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/item.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/skill.dart';

extension CraftExtension on CraftSchema {
  Craft convert() {
    return Craft(
      skill: skill?.convert(),
      level: level,
      items: items?.map((i) => i.convert()).toList() ?? [],
      quantity: quantity,
    );
  }
}
