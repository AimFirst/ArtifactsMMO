import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/models/quantity_item_schema.dart';

extension ItemExtension on ItemSchema {
  SimpleItemSchema get simpleItem => (SimpleItemSchemaBuilder()
        ..code = code
        ..quantity = 1)
      .build();

  QuantityItemSchema get quantityItem => QuantityItemSchema(this, 1);

  int totalEffect(EffectEnum effectType) {
    return effects?.fold(0, (previousTotal, effect) => (previousTotal ?? 0) + (effect.code == effectType.name ? effect.value : 0)) ?? 0;
  }
}
