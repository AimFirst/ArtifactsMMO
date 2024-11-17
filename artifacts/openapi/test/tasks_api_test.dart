import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for TasksApi
void main() {
  final instance = ArtifactsApi().getTasksApi();

  group(TasksApi, () {
    // Get All Tasks Rewards
    //
    // Fetch the list of all tasks rewards. To obtain these rewards, you must exchange 6 task coins with a tasks master.
    //
    //Future<DataPageDropRateSchema> getAllTasksRewardsTasksRewardsGet({ int page, int size }) async
    test('test getAllTasksRewardsTasksRewardsGet', () async {
      // TODO
    });

    // Get All Tasks
    //
    // Fetch the list of all tasks.
    //
    //Future<DataPageTaskFullSchema> getAllTasksTasksListGet({ int minLevel, int maxLevel, Skill skill, TaskType type, int page, int size }) async
    test('test getAllTasksTasksListGet', () async {
      // TODO
    });

    // Get Task
    //
    // Retrieve the details of a task.
    //
    //Future<TaskFullResponseSchema> getTaskTasksListCodeGet(String code) async
    test('test getTaskTasksListCodeGet', () async {
      // TODO
    });

    // Get Tasks Reward
    //
    // Retrieve the details of a tasks reward.
    //
    //Future<TasksRewardResponseSchema> getTasksRewardTasksRewardsCodeGet(String code) async
    test('test getTasksRewardTasksRewardsCodeGet', () async {
      // TODO
    });
  });
}
