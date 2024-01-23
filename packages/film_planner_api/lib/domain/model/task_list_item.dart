import '../enum/task_status_enum.dart';

class TaskListItem {
  const TaskListItem({
    required this.id,
    required this.name,
    required this.description,
    required this.lastModified,
    required this.status,
  });

  final String id;
  final String name;
  final String description;
  final DateTime lastModified;
  final TaskStatusEnum status;
}
