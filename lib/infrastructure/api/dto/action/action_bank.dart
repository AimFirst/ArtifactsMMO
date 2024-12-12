
import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';

abstract class ActionBankResponse extends ActionResponse {
  ActionBankResponse({required super.cooldown, required super.character});
}

abstract class ActionBank extends Action {
  ActionBank({required super.characterName});

}