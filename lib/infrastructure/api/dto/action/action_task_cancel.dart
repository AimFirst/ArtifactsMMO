import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';

class ActionTaskCancelResponse extends ActionResponse {
  ActionTaskCancelResponse({
    required super.cooldown,
    required super.character,
  });
}

class ActionTaskCancel extends Action {
  ActionTaskCancel({required super.characterName});
}
