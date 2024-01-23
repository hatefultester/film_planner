import 'package:equatable/equatable.dart';
import 'package:film_planner/features/task_list/domain/enums/task_list_status_enum.dart';

class TaskListEntity extends Equatable {
  const TaskListEntity({
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
  final TaskListStatusEnum status;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        lastModified,
        status,
      ];
}