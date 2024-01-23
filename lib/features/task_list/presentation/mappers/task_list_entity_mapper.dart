import 'package:film_planner/features/task_list/domain/entities/task_list_entity.dart';

extension TaskListEntityMapper on TaskListEntity {
  String get getLastModifiedText {
    final days = DateTime.now().difference(lastModified).inDays;
    if (days == 0) {
      return 'Today';
    } else if (days == 1) {
      return '1 Day ago';
    } else {
      return '$days days ago';
    }
  }
}
