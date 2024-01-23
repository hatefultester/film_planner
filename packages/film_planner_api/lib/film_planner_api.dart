library film_planner_api;

export 'package:dio/dio.dart';
export 'package:dartz/dartz.dart';

import 'package:film_planner_api/api/fake_task_list_api.dart';
import 'package:film_planner_api/domain/interfaces/i_task_list_api.dart';

class FilmPlannerApiClient {
  const FilmPlannerApiClient();

  ITaskListApi get taskListApi => const FakeTaskListApi();
}
