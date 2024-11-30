import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/active_event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/map.dart';

extension ActiveEventConversion on ActiveEventSchema {
  ActiveEvent convert() {
    return ActiveEvent(
      name: name,
      code: code,
      map: map.convert(),
      previousSkin: previousSkin,
      duration: duration,
      expiration: expiration,
      createdAt: createdAt,
    );
  }
}

extension EventConversion on EventSchema {
  Event convert() {
    return Event(
      name: name,
      code: code,
      maps: maps.map((m) => m.convert()).toList(),
      skin: skin,
      duration: duration,
      rate: rate,
      content: content.convert(),
    );
  }
}

extension EventMapsConversion on EventMapSchema {
  Location convert() {
    return Location(x: x, y: y,);
  }
}

extension EventContentConversion on EventContentSchema {
  Content convert() {
    return Content(
      type: type,
      code: code,
    );
  }
}
