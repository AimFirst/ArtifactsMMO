import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/models/location_schema.dart';

extension CharacterExtensions on CharacterSchema {
  LocationSchema get location => LocationSchema(x: x, y: y);
  int get inventoryCount => inventory?.fold(0, (sum, item) => ((sum ?? 0) + item.quantity)) ?? 0;
}