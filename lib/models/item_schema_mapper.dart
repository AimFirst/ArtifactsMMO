import 'dart:convert';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:dart_mappable/dart_mappable.dart';

class ItemSchemaMapper extends SimpleMapper<ItemSchema> {
  const ItemSchemaMapper();

  @override
  ItemSchema decode(Object value) {
    String jsonString = value as String;

    // Deserialize the JSON string to a Map
    final decodedJson = jsonDecode(jsonString);

    // Deserialise the Map to your built_value object
    return serializers.deserializeWith(ItemSchema.serializer, decodedJson)!;
  }

  @override
  Object? encode(ItemSchema self) {
    // Serialize to Map
    final serializedMap =
        serializers.serializeWith(ItemSchema.serializer, self);

    // Convert Map to JSON string
    return json.encode(serializedMap);
  }
}
