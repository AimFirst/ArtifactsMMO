import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';

extension MapConversion on MapSchema {
  MapLocation convert() {
    return MapLocation(
      location: Location(x: x, y: y),
      content: content?.convert(),
      skin: skin,
    );
  }
}

extension MapContentSchemaConversion on MapContentSchema {
  Content convert() {
    return Content(
      type: ContentType.values.byName(type),
      code: code,
    );
  }
}
