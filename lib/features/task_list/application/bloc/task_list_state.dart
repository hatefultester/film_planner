part of 'task_list_bloc.dart';

sealed class TaskListState extends Equatable {
  const TaskListState();
}

class LoadingTaskListState extends TaskListState {
  const LoadingTaskListState();

  @override
  List<Object?> get props => [];
}

class LoadedTaskListState extends TaskListState {
  const LoadedTaskListState._internal({
    required this.toDoTasks,
    required this.onProcessTasks,
    required this.finishedTasks,
  });

  factory LoadedTaskListState(List<TaskListEntity> tasks) {
    final toDoTasks = tasks.where((task) => task.status == TaskListStatusEnum.toDo).toList()
      ..sort((a, b) => b.lastModified.compareTo(a.lastModified));
    final onProcessTasks = tasks.where((task) => task.status == TaskListStatusEnum.onProcess).toList()
      ..sort((a, b) => b.lastModified.compareTo(a.lastModified));
    final finishedTasks = tasks.where((task) => task.status == TaskListStatusEnum.finished).toList()
      ..sort((a, b) => b.lastModified.compareTo(a.lastModified));

    return LoadedTaskListState._internal(
      toDoTasks: toDoTasks,
      onProcessTasks: onProcessTasks,
      finishedTasks: finishedTasks,
    );
  }

  final List<TaskListEntity> toDoTasks;
  final List<TaskListEntity> onProcessTasks;
  final List<TaskListEntity> finishedTasks;

  LoadedTaskListState copyWith({
    List<TaskListEntity>? toDoTasks,
    List<TaskListEntity>? onProcessTasks,
    List<TaskListEntity>? finishedTasks,
  }) =>
      LoadedTaskListState._internal(
        toDoTasks: toDoTasks ?? this.toDoTasks,
        onProcessTasks: onProcessTasks ?? this.onProcessTasks,
        finishedTasks: finishedTasks ?? this.finishedTasks,
      );

  @override
  List<Object?> get props => [toDoTasks, onProcessTasks, finishedTasks];
}

class ErrorTaskListState extends TaskListState {
  const ErrorTaskListState(this.failure);

  final ApiFailure failure;

  @override
  List<Object?> get props => [failure];
}
