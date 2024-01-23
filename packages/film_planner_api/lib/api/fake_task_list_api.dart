import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:film_planner_api/domain/api_failure.dart';
import 'package:film_planner_api/domain/interfaces/i_task_list_api.dart';
import 'package:film_planner_api/domain/model/task_list_item.dart';
import 'package:film_planner_api/domain/response/task_list_response.dart';

import '../domain/enum/task_status_enum.dart';

class FakeTaskListApi implements ITaskListApi {
  const FakeTaskListApi();

  @override
  Future<Either<ApiFailure, TaskListResponse>> getTaskList({required String userId, CancelToken? cancelToken}) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(TaskListResponse(taskList: [
      TaskListItem(
          id: '1',
          name: 'Task Name',
          description: 'Description here of the task written by the user.',
          lastModified: DateTime.now().subtract(const Duration(days: 1)),
          status: TaskStatusEnum.toDo),
      TaskListItem(
          id: '2',
          name: 'Task Name',
          description: 'Description here of the task written by the user.',
          lastModified: DateTime.now().subtract(const Duration(days: 1)),
          status: TaskStatusEnum.onProcess),
      TaskListItem(
          id: '3',
          name: 'Task Name',
          description: 'Description here of the task written by the user.',
          lastModified: DateTime.now().subtract(const Duration(days: 1)),
          status: TaskStatusEnum.onProcess),
      TaskListItem(
          id: '4',
          name: 'Task Name',
          description: 'Description here of the task written by the user.',
          lastModified: DateTime.now().subtract(const Duration(days: 1)),
          status: TaskStatusEnum.onProcess),
      TaskListItem(
          id: '5',
          name: 'Task Name',
          description: 'Description here of the task written by the user.',
          lastModified: DateTime.now().subtract(const Duration(days: 1)),
          status: TaskStatusEnum.finished),
      TaskListItem(
          id: '6',
          name: 'Task Name',
          description: 'Description here of the task written by the user.',
          lastModified: DateTime.now().subtract(const Duration(days: 1)),
          status: TaskStatusEnum.finished),
    ]));
  }
}
