import 'package:film_planner/features/task_list/domain/enums/task_list_status_enum.dart';
import 'package:film_planner_api/domain/enum/task_status_enum.dart';

extension TaskListStatusMapper on TaskStatusEnum {
  TaskListStatusEnum toEntity() {
    switch (this) {
      case TaskStatusEnum.toDo:
        return TaskListStatusEnum.toDo;
      case TaskStatusEnum.onProcess:
        return TaskListStatusEnum.onProcess;
      case TaskStatusEnum.finished:
        return TaskListStatusEnum.finished;
    }
  }
}
