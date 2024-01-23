import 'package:film_planner/features/task_list/domain/entities/task_list_entity.dart';
import 'package:film_planner_api/domain/api_failure.dart';
import 'package:film_planner_api/film_planner_api.dart';

abstract interface class ITaskListRepository {
  Future<Either<ApiFailure, List<TaskListEntity>>> getTaskList({
    required String userId,
    CancelToken? cancelToken,
  });
}