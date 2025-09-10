import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/extensions/item_extension.dart';
import 'package:artifacts_mmo/models/item_schema_mapper.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'quantity_item_schema.mapper.dart';

@MappableClass(includeCustomMappers: [ItemSchemaMapper()])
class QuantityItemSchema with QuantityItemSchemaMappable {
  final ItemSchema item;
  final int quantity;
  QuantityItemSchema(this.item, this.quantity);

  int totalEffect(EffectEnum effectType) {
    return item.totalEffect(effectType) * quantity;
  }

  SimpleItemSchema toSimpleItemSchema() {
    return (SimpleItemSchemaBuilder()..code = item.code..quantity = quantity).build();
  }
}