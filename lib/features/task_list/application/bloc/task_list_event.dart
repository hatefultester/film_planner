part of 'task_list_bloc.dart';

sealed class TaskListEvent extends Equatable {
  const TaskListEvent();
}

class GetTaskListEvent extends TaskListEvent {
  const GetTaskListEvent({
    required this.userId,
  });

  final String userId;

  @override
  List<Object?> get props => [userId];
}
