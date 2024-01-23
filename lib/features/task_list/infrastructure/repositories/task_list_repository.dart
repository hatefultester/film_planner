import 'package:dartz/dartz.dart';
import 'package:dio/src/cancel_token.dart';
import 'package:film_planner/features/task_list/domain/entities/task_list_entity.dart';
import 'package:film_planner/features/task_list/domain/interfaces/i_task_list_repository.dart';
import 'package:film_planner/features/task_list/infrastructure/dto/task_list_entity_mapper.dart';
import 'package:film_planner_api/domain/api_failure.dart';
import 'package:film_planner_api/domain/interfaces/i_task_list_api.dart';

class TaskListRepository implements ITaskListRepository {
  const TaskListRepository(this._taskListApi);

  final ITaskListApi _taskListApi;

  @override
  Future<Either<ApiFailure, List<TaskListEntity>>> getTaskList(
      {required String userId, CancelToken? cancelToken}) async {
    final response = await _taskListApi.getTaskList(userId: userId, cancelToken: cancelToken);
    return response.fold(
      (l) => Left(l),
      (r) => Right(r.taskList.map((e) => e.toEntity()).toList()),
    );
  }
}
