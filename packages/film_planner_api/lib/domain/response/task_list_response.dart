import '../model/task_list_item.dart';

class TaskListResponse {
  const TaskListResponse({
    required this.taskList,
  });

  final List<TaskListItem> taskList;
}
