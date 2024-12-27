import 'dart:developer';
import 'dart:ui' as ui;

import 'package:artifacts_mmo/business/state/character_state.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MapView extends StatefulWidget {
  final TargetBasedUpaModelLoaded model;
  late final Offset centerCoordinates;
  final Map<String, ImageProviderListener> _cachedImages = {};
  final tileImageSize = 150;
  late final Map<Location, MapLocation> _mapLocations;

  MapView({
    super.key,
    required this.model,
  }) {
    _mapLocations = model.state.boardState.map;
    final centerLocation =
        model.state.characterStates[model.selectedChar]?.character.location ??
            const Location(x: 0, y: 0);
    centerCoordinates = Offset(
        (centerLocation.x * tileImageSize) + (tileImageSize / 2),
        (centerLocation.y * tileImageSize) + (tileImageSize / 2));
  }

  @override
  _MapViewState createState() => _MapViewState();
}

class ImageProviderListener implements ImageStreamListener {
  ImageInfo? imageInfo;
  ImageStream? imageStream;

  void setImageStream(ImageStream imageStream) {
    if (this.imageStream != null) {
      this.imageStream!.removeListener(this);
    }
    this.imageStream = imageStream;
    imageStream.addListener(this);
  }

  @override
  ImageChunkListener? get onChunk => (chunk) {};

  @override
  ImageErrorListener? get onError => (ex, trace) {
        log('Failed to get image: $ex');
      };

  @override
  ImageListener get onImage => (imageInfo, sync) {
        this.imageInfo = imageInfo;
      };
}

class _MapViewState extends State<MapView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _ImageGridPainter(
        centerCoordinates: widget.centerCoordinates,
        imageSize: widget.tileImageSize,
        cachedImages: widget._cachedImages,
        context: context,
        mapLocations: widget._mapLocations,
        characters: widget.model.state.characterStates.values.toList(),
      ),
    );
  }
}

class _ImageGridPainter extends CustomPainter {
  final Offset centerCoordinates;
  final int imageSize;
  final Map<String, ImageProviderListener> cachedImages;
  final Map<Location, MapLocation> mapLocations;
  final BuildContext context;
  final List<CharacterState> characters;

  _ImageGridPainter({
    required this.centerCoordinates,
    required this.imageSize,
    required this.cachedImages,
    required this.mapLocations,
    required this.context,
    required this.characters,
  });

  Future<void> _loadImage(BuildContext context, String url) async {
    final provider = CachedNetworkImageProvider(url,
        maxWidth: imageSize, maxHeight: imageSize);
    final stream = provider.resolve(createLocalImageConfiguration(context));
    final listener = cachedImages[url] ?? ImageProviderListener();
    listener.setImageStream(stream);
    cachedImages[url] = listener;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // How many images can we show.
    final tileCountX = (size.width / imageSize).ceil();
    final tileCountY = (size.height / imageSize).ceil();

    // Calculate the center ones.
    final tileCenterX = (centerCoordinates.dx / imageSize).toInt();
    final tileCenterY = (centerCoordinates.dy / imageSize).toInt();
    final tileStartX = (tileCenterX - (tileCountX / 2).floor());
    final tileStartY = (tileCenterY - (tileCountY / 2).floor());
    final tileAbsoluteOffsetX = -(centerCoordinates.dx / imageSize) % 1;
    final tileAbsoluteOffsetY = -(centerCoordinates.dy / imageSize) % 1;

    final Map<Location, List<CharacterState>> characterLocations = {};
    for (final char in characters) {
      final charList = characterLocations[char.character.location] ?? [];
      charList.add(char);
      characterLocations[char.character.location] = charList;
    }

    // Draw the tiles.
    for (var x = 0; x < tileCountX; x++) {
      for (var y = 0; y < tileCountY; y++) {
        final tileLocation = Location(x: tileStartX + x, y: tileStartY + y);
        final mapLocation = mapLocations[tileLocation]!;
        final mapImage = cachedImages[mapLocation.url];

        final absoluteCoordsX = (x * imageSize) + tileAbsoluteOffsetX;
        final absoluteCoordsY = (y * imageSize) + tileAbsoluteOffsetY;

        // Load the map image if it's null
        if (mapImage == null) {
          _loadImage(
            context,
            mapLocation.url,
          );
        } else if (mapImage.imageInfo?.image != null) {
          // Draw the map image
          paintImage(
            canvas: canvas,
            rect: ui.Rect.fromLTWH(
              absoluteCoordsX,
              absoluteCoordsY,
              imageSize.toDouble(),
              imageSize.toDouble(),
            ),
            image: mapImage.imageInfo!.image,
            fit: BoxFit.fill,
          );
        }

        // Do we have a character at this location?
        final chars = characterLocations[tileLocation] ?? [];
        for (final char in chars) {
          // Load the character image if it's null
          final charImage = cachedImages[char.character.imageUrl];
          if (charImage == null) {
            _loadImage(
              context,
              char.character.imageUrl,
            );
          } else if (charImage.imageInfo?.image != null) {
            paintImage(
              canvas: canvas,
              rect: ui.Rect.fromLTWH(
                absoluteCoordsX,
                absoluteCoordsY + (imageSize * .25),
                imageSize.toDouble(),
                imageSize.toDouble() / 4,
              ),
              image: charImage.imageInfo!.image,
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
            );
            const textSize = 12.0;
            TextSpan outline = TextSpan(style:  TextStyle(
              fontSize: textSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 4
                ..color = Colors.black,
            ), text: char.character.name);
            TextPainter outlineTP = TextPainter(text: outline, textAlign: TextAlign.center, textDirection: ui.TextDirection.ltr);
            outlineTP.layout(minWidth: imageSize.toDouble());
            outlineTP.paint(canvas, Offset(absoluteCoordsX, absoluteCoordsY + (imageSize * .5)));

            TextSpan fill = TextSpan(style:  TextStyle(
              fontSize: textSize,
                    color: Colors.white,
            ), text: char.character.name);
            TextPainter fillTP = TextPainter(text: fill, textAlign: TextAlign.center, textDirection: ui.TextDirection.ltr);
            fillTP.layout(minWidth: imageSize.toDouble());
            fillTP.paint(canvas, Offset(absoluteCoordsX, absoluteCoordsY + (imageSize * .5)));
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(_ImageGridPainter oldDelegate) {
    return oldDelegate.centerCoordinates != centerCoordinates ||
        oldDelegate.imageSize != imageSize ||
        oldDelegate.cachedImages.values
                .fold(0, (o, i) => o + (i.imageInfo != null ? 1 : 0)) !=
            cachedImages.values
                .fold(0, (o, i) => o + (i.imageInfo != null ? 1 : 0));
  }
}
