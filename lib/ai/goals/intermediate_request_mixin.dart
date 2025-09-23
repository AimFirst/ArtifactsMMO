import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';

mixin class IntermediateRequestMixin {
  Map<String, SimpleItemSchema> neededRequestItems(
      TeamBrainProvider teamBrainProvider) {
    final Map<String, SimpleItemSchema> itemsNeeded = {};
    for (final request in teamBrainProvider.openRequests) {
      final requestedItem = request.requestedItem;
      final currentNeed = itemsNeeded.putIfAbsent(
          requestedItem.code,
          () => SimpleItemSchemaBuilder()
              .fromCodeAndQuantity(requestedItem.code, 0));
      itemsNeeded[requestedItem.code] = SimpleItemSchemaBuilder()
          .fromCodeAndQuantity(requestedItem.code,
              currentNeed.quantity + requestedItem.quantity);
    }
    return itemsNeeded;
  }

  List<SimpleItemSchema> remainingNeededItems(
      TeamBrainProvider teamBrainProvider, BankProvider bankProvider) {
    List<SimpleItemSchema> itemsNeeded = [];
    final neededItems = neededRequestItems(teamBrainProvider);
    for (final neededItem in neededItems.values) {
      final bankCount = bankProvider.count(neededItem.code);
      if (bankCount < neededItem.quantity) {
        itemsNeeded.add(SimpleItemSchemaBuilder().fromCodeAndQuantity(
            neededItem.code, neededItem.quantity - bankCount));
      }
    }
    return itemsNeeded;
  }
}
