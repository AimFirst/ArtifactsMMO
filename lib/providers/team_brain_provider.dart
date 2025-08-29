// lib/providers/team_brain_provider.dart
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

class ItemRequest {
  final String key;
  final String itemName;
  final int quantity;
  final String requestedBy; // Name of the character who needs it
  String? fulfilledBy; // Name of the character who will deliver it

  ItemRequest(this.key, this.itemName, this.quantity, this.requestedBy);
}

class TeamBrainProvider with ChangeNotifier {
  final List<ItemRequest> _requests = [];

  List<ItemRequest> get openRequests =>
      _requests.where((r) => r.fulfilledBy == null).toList();

  void postRequest(ItemRequest request) {

    // Remove any duplicate requests first.
    final existingRequest = _requests.firstWhereOrNull((r) => r.key == request.key && r.requestedBy == request.requestedBy && r.itemName == request.itemName,);
    if (existingRequest != null) {
      _requests.remove(existingRequest);
    }

    _requests.add(request);
    notifyListeners();
    LoggerService.instance.log(
        "REQUEST: ${request.requestedBy} posted a request for ${request.quantity} ${request.itemName}.");
  }

  void fulfillRequest(ItemRequest request, String characterName) {
    request.fulfilledBy = characterName;
    notifyListeners();
    LoggerService.instance.log(
        "REQUEST: ${request.fulfilledBy} accepted the request for ${request.itemName}.");
  }

  void completeRequest(ItemRequest request) {
    _requests.remove(request);
    notifyListeners();
  }
}
