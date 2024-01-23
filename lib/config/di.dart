import 'package:film_planner/features/task_list/application/bloc/task_list_bloc.dart';
import 'package:film_planner/features/task_list/domain/interfaces/i_task_list_repository.dart';
import 'package:film_planner_api/domain/interfaces/i_task_list_api.dart';
import 'package:film_planner_api/film_planner_api.dart';
import 'package:get_it/get_it.dart';

import '../features/core/application/platform_bloc.dart';
import '../features/core/domain/interfaces/i_platform_repository.dart';
import '../features/core/infrastracture/repositories/platform_repository.dart';
import '../features/task_list/infrastructure/repositories/task_list_repository.dart';

late final GetIt sl;

void injection() async {
  sl = GetIt.instance;
  const api = FilmPlannerApiClient();

  // Platform dependencies
  sl
    ..registerFactory<IPlatformRepository>(() => const PlatformRepository())
    ..registerFactory<PlatformBloc>(() => PlatformBloc(sl()));

  // Task list dependencies
  sl
    ..registerFactory<ITaskListApi>(() => api.taskListApi)
    ..registerFactory<ITaskListRepository>(() => TaskListRepository(sl()))
    ..registerFactory<TaskListBloc>(() => TaskListBloc(sl()));
}

void mockInjectionWidgetTest(GetIt instance) {
  sl = instance;
}
