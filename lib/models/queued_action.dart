import 'package:dio/dio.dart';

class QueuedAction {
  final String actionName;
  final Future<Response<dynamic>> Function() apiCall;

  QueuedAction({
    required this.actionName,
    required this.apiCall,
  });
}
