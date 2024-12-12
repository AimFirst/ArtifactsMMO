import 'package:artifacts_mmo/business/state/board/all_page_loader.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/active_event.dart';
import 'package:rxdart/rxdart.dart';

class EventManager extends BoardElementManager {
  final activeEventsSubject = BehaviorSubject<List<ActiveEvent>>.seeded([]);

  EventManager({required super.artifactsClient});

  @override
  Future<void> init() async {
    activeEventsSubject.value = await AllPageLoader.loadAllPaged(
          (int page) => artifactsClient.getActiveEvents(pageNumber: page),
    );
  }

}