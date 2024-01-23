import 'package:film_planner/features/task_list/domain/entities/task_list_entity.dart';
import 'package:film_planner/features/task_list/infrastructure/dto/task_list_status_mapper.dart';
import 'package:film_planner_api/domain/model/task_list_item.dart';

extension TaskListEntityMapper on TaskListItem {
  TaskListEntity toEntity() {
    return TaskListEntity(
      id: id,
      name: name,
      description: description,
      lastModified: lastModified,
      status: status.toEntity(),
    );
  }
}
