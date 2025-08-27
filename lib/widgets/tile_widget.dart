// lib/widgets/tile_widget.dart

import 'package:artifacts_mmo/models/character_state.dart';
import 'package:flutter/material.dart';
import 'package:artifacts_api/artifacts_api.dart';

class TileWidget extends StatelessWidget {
  final MapSchema tile;
  final List<CharacterState> charactersOnTile;

  const TileWidget({
    super.key,
    required this.tile,
    required this.charactersOnTile,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://client.artifactsmmo.com/images/maps/${tile.skin}.png';
    final contentWidget = _getTileContentWidget(); // Renamed to better reflect what it returns

    return Stack(
      fit: StackFit.expand,
      children: [
        // --- Layer 1: The Background Image ---
        Image.network(
          imageUrl,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.pink,
              child: const Icon(Icons.broken_image, color: Colors.white, size: 18), // Better error icon
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(color: Colors.grey.shade800);
          },
        ),

        // --- Layer 2: The Foreground Content (Character, Building, Resource) ---
        if (contentWidget != null)
          Center(child: contentWidget),
      ],
    );
  }

  // Renamed from _getTileIcon to _getTileContentWidget
  Widget? _getTileContentWidget() {
    // Character image takes top priority
    if (charactersOnTile.isNotEmpty) {
      final character = charactersOnTile.first.character; // Show the first character
      final characterImageUrl = 'https://client.artifactsmmo.com/images/characters/${character.skin}.png';

      return Container(
        // Optional: Add a subtle background to make character stand out
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(2), // Padding around the image
        child: ClipOval( // Clip the image to a circle
          child: Image.network(
            characterImageUrl,
            fit: BoxFit.cover,
            width: 24, // Control character image size
            height: 24,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.person_off, color: Colors.red, size: 18); // Fallback for missing character image
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2));
            },
          ),
        ),
      );
    }

    return null; // Empty tile
  }
}