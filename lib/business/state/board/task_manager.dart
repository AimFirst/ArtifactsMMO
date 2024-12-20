import 'package:artifacts_mmo/business/state/board/all_page_loader.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';
import 'package:rxdart/rxdart.dart';

class TaskManager extends BoardElementManager {
  final tasksSubject = BehaviorSubject<List<Task>>.seeded([]);

  TaskManager({required super.artifactsClient});

  @override
  Future<void> init() async {
    tasksSubject.value = await AllPageLoader.loadAllPaged(
      (int page) => artifactsClient.getTasks(pageNumber: page),
    );
  }
}
