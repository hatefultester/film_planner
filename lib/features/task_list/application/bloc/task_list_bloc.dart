import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:film_planner_api/domain/api_failure.dart';
import 'package:film_planner_api/film_planner_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task_list_entity.dart';
import '../../domain/enums/task_list_status_enum.dart';
import '../../domain/interfaces/i_task_list_repository.dart';

part 'task_list_event.dart';

part 'task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  TaskListBloc(this._repository) : super(const LoadingTaskListState()) {
    on<GetTaskListEvent>(_onGetTaskListEvent, transformer: restartable());
  }

  final ITaskListRepository _repository;
  final CancelToken _cancelToken = CancelToken();

  @override
  Future<void> close() {
    _cancelToken.cancel();
    return super.close();
  }

  FutureOr<void> _onGetTaskListEvent(GetTaskListEvent event, Emitter<TaskListState> emit) async {
    final repositoryResult = await _repository.getTaskList(
      userId: event.userId,
      cancelToken: _cancelToken,
    );
    final result = repositoryResult.fold(ErrorTaskListState.new, LoadedTaskListState.new);
    emit(result);
  }
}
