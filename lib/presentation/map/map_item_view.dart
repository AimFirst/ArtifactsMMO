import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:flutter/cupertino.dart';

class MapItemView extends StatelessWidget {
  final MapLocation mapLocation;
  final Location characterLocation;
  const MapItemView({super.key, required this.mapLocation, required this.characterLocation});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$mapLocation'),
        const Spacer(),
        Text(mapLocation.skin),
        const Spacer(),
        Text(mapLocation.content?.type ?? ''),
        const Spacer(),
        Text(mapLocation.content?.code ?? ''),
        const Spacer(),
        Text('${mapLocation.location.distance(characterLocation)}')
      ],
    );
  }

}