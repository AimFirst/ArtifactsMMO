// lib/models/world_map.dart

import 'package:artifacts_api/artifacts_api.dart';

// A simple class to hold the combined data from all map pages.
class WorldMap {
  final List<MapSchema> tiles;

  WorldMap({required this.tiles});
}