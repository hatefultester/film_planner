import 'package:film_planner/features/task_list/domain/enums/task_list_status_enum.dart';

extension TaskListStatusMapper on TaskListStatusEnum {
  String get toText {
    switch (this) {
      case TaskListStatusEnum.toDo:
        return 'To Do';
      case TaskListStatusEnum.onProcess:
        return 'On Process';
      case TaskListStatusEnum.finished:
        return 'Finished';
      default:
        return '';
    }
  }
}
