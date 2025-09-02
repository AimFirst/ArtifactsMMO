import 'package:artifacts_mmo/models/character_state.dart';
import 'package:dio/dio.dart';

class QueuedAction {
  final String actionName;
  final Future<Response<dynamic>> Function() apiCall;
  final bool Function(CharacterState state)? shouldPerform;

  QueuedAction({
    required this.actionName,
    required this.apiCall,
    this.shouldPerform,
  });
}
