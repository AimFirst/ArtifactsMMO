import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:built_collection/built_collection.dart';

extension TeamProviderActions on TeamProvider {
  void queueMoveTo(CharacterSchema character, DestinationSchema destination) {
    // If we are already there, just exit.
    if (character.location.x == destination.x && character.location.y == destination.y) {
      return;
    }

    queueAction(character.name, actionFactory.createMoveAction(character.name, destination.x, destination.y));
  }

  void queueBankWithdraw(CharacterSchema character, BuiltList<SimpleItemSchema> items) {
    // find closest bank
    final bankLocation = mapProvider.findNearestTile(character.location, (tile) => tile.content?.code == 'bank');
    if (bankLocation == null) {
      LoggerService.instance.log('${character.name} couldn\'t find a bank!', level: LogLevel.warning);
      return;
    }

    queueMoveTo(character, bankLocation);

    queueAction(character.name, actionFactory.createBankWithdrawAction(character.name, items));
  }

  void queueBankDeposit(CharacterSchema character, BuiltList<SimpleItemSchema> items) {
    // find closest bank
    final bankLocation = mapProvider.findNearestTile(character.location, (tile) => tile.content?.code == 'bank');
    if (bankLocation == null) {
      LoggerService.instance.log('${character.name} couldn\'t find a bank!', level: LogLevel.warning);
      return;
    }

    queueMoveTo(character, bankLocation);

    queueAction(character.name, actionFactory.createBankDepositAction(character.name, items));
  }

}