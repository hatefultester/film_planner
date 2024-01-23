import '../../application/bloc/task_list_bloc.dart';
import '../../domain/entities/task_list_entity.dart';

extension TaskListStatePresentationMapper on TaskListState {
  List<TaskListEntity>? get toDoTasks => this is LoadedTaskListState ? (this as LoadedTaskListState).toDoTasks : null;

  List<TaskListEntity>? get onProcessTasks =>
      this is LoadedTaskListState ? (this as LoadedTaskListState).onProcessTasks : null;

  List<TaskListEntity>? get finishedTasks =>
      this is LoadedTaskListState ? (this as LoadedTaskListState).finishedTasks : null;
}
