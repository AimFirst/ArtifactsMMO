import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

class ItemRequest {
  final String keyPrefix;
  final SimpleItemSchema requestedItem;
  final String requestedBy; // Name of the character who needs it
  ItemRequest?
      parentRequest; // If we are needing these items to fulfill a parent request, keep track so we can monitor them all together.
  List<ItemRequest>
      childrenRequests; // Requests made as part of the process to get everything we need for this request.

  String get key {
    return buildRequestKey(parentRequest, keyPrefix, requestedItem.code, requestedBy);
  }

  int get depthCount {
    return (parentRequest?.depthCount ?? 0) + 1;
  }

  ItemRequest({
    required this.keyPrefix,
    required this.requestedItem,
    required this.requestedBy,
    required this.childrenRequests,
    this.parentRequest,
  });

  static String buildRequestKey(ItemRequest? parentRequest, String keyPrefix, String requestedItemCode, String requestedBy) {
    if (parentRequest == null) {
      return '${requestedBy}_${keyPrefix}_${requestedItemCode}';
    } else {
      return '${parentRequest.key}:${keyPrefix}_${requestedItemCode}';
    }
  }
}

class TeamBrainProvider with ChangeNotifier {
  final List<ItemRequest> _requests = [];

  List<ItemRequest> get openRequests => [..._requests];

  void postRequest(ItemRequest request) {
    // Remove any duplicate requests first.
    final existingRequest = _requests.firstWhereOrNull(
      (r) =>
          r.key == request.key
    );
    if (existingRequest != null) {
      _requests.remove(existingRequest);
    }

    _requests.add(request);

    if (request.parentRequest != null) {
      request.parentRequest!.childrenRequests.add(request);
    }

    notifyListeners();
    LoggerService.instance.log(
        "REQUEST: ${request.requestedBy} posted a request for ${request.requestedItem.simpleName}.");
  }

  bool hasRequest(ItemRequest? parentRequest, String keyPrefix, String requestedItemCode, String requestedBy) {
    return _hasRequestKey(ItemRequest.buildRequestKey(parentRequest, keyPrefix, requestedItemCode, requestedBy));
  }

  bool _hasRequestKey(String key) {
    return _requests.any((r) => r.key == key);
  }

  void _completeRequestKey(String key, {bool notify = true}) {
    // Find the request.
    final request = _requests.firstWhereOrNull((r) => r.key == key);
    if (request == null) {
      LoggerService.instance.log('REQUEST: No request to complete found for key: $key', level: LogLevel.warning);
      return;
    }

    // Remove any children of this request.
    request.childrenRequests.forEach((childRequest) {
      _completeRequestKey(childRequest.key, notify: false);
    });

    // Remove the request
    _requests.remove(request);

    if (notify) {
      notifyListeners();
    }
  }

  void completeRequest(ItemRequest? parentRequest, String keyPrefix, String requestedItemCode, String requestedBy) {
    _completeRequestKey(ItemRequest.buildRequestKey(parentRequest, keyPrefix, requestedItemCode, requestedBy));
  }
}
