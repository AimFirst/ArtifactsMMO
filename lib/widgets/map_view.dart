// lib/widgets/map_view.dart

import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/map_provider.dart';
import '../providers/team_provider.dart';
import '../providers/world_data_provider.dart';
import 'tile_widget.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch multiple providers to get all the data we need
    final mapProvider = context.watch<MapProvider>();
    final teamProvider = context.watch<TeamProvider>();
    final worldDataProvider = context.watch<WorldDataProvider>();

    if (mapProvider.isLoading || mapProvider.worldMap == null) {
      return const Center(child: Text("Loading map..."));
    }

    final worldMap = mapProvider.worldMap!;
    final characters = teamProvider.characters;

    final sortedTiles = worldMap.tiles
      ..sort((a, b) {
        final yComparison = a.y.compareTo(b.y);
        if (yComparison != 0) {
          return yComparison;
        }
        return a.x.compareTo(b.x);
      });

    // A simple way to determine map dimensions
    final minX = sortedTiles.first.x;
    final maxX = sortedTiles.last.x;
    final mapWidth = maxX - minX + 1;
    final minY = sortedTiles.first.y;
    final maxY = sortedTiles.last.y;
    final mapHeight = maxY - minY + 1;

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final columns = mapWidth;
        final rows = mapHeight;
        final tileWidth = screenWidth / columns;
        final tileHeight = screenHeight / rows;
        final aspectRatio = tileWidth / tileHeight;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: mapWidth,
            childAspectRatio: aspectRatio,
          ),
          itemCount: sortedTiles.length,
          itemBuilder: (context, index) {
            final tile = sortedTiles[index];

            // Find which characters are currently on this tile
            final charactersOnTile = characters
                .where((c) =>
                    c.character.location.x == tile.x &&
                    c.character.location.y == tile.y)
                .toList();

            return TileWidget(
              tile: tile,
              charactersOnTile: charactersOnTile,
            );
          },
        );
      },
    );
  }
}
