import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../api_failure.dart';
import '../response/task_list_response.dart';

abstract interface class ITaskListApi {
  Future<Either<ApiFailure, TaskListResponse>> getTaskList({
    required String userId,
    CancelToken? cancelToken,
  });
}