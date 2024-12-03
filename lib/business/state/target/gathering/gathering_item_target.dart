import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';

class GatheringItemTarget extends GatheringTarget {
  final ItemQuantity targetItemQuantity;

  GatheringItemTarget({required this.targetItemQuantity});

  @override
  Progress getProgress(
      {required Character character, required BoardState boardState}) {
    return Progress(
        current: character.inventoryItems.fold(
          0,
          (previousValue, element) =>
              element.itemQuantity.code == targetItemQuantity.code
                  ? element.itemQuantity.quantity.toDouble()
                  : 0.toDouble(),
        ),
        target: targetItemQuantity.quantity.toDouble());
  }

  @override
  List<Resource> getTargetResource(
      {required Character character, required BoardState boardState}) {
    final resourceOptions = boardState.dropsFromResources[
        Content(type: ContentType.resource, code: targetItemQuantity.code)];
    if (resourceOptions == null) {
      throw ArtifactsException(
          errorMessage:
              'Unable to find resource for ${targetItemQuantity.code}');
    }

    resourceOptions.sort((a, b) {
      final dif = b.drops
              .firstWhere((d) => d.code == targetItemQuantity.code)
              .averageQuantity -
          a.drops
              .firstWhere((d) => d.code == targetItemQuantity.code)
              .averageQuantity;
      return dif < 0
          ? -1
          : dif > 0
              ? 1
              : 0;
    });

    return resourceOptions;
  }

  @override
  String get name => "Gather Target Item";
}
