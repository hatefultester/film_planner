import 'package:film_planner/config/palette.dart';
import 'package:film_planner/features/task_list/presentation/mappers/task_list_entity_mapper.dart';
import 'package:film_planner/features/task_list/presentation/model/task_pop_up_menu_option_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/task_list_entity.dart';

typedef OnTaskOptionTapped = void Function(TaskPopUpMenuOptionEnum, String taskId);

class TasksListViewBuilder extends StatelessWidget {
  const TasksListViewBuilder({
    super.key,
    required this.title,
    required this.taskList,
    this.onTaskOptionTap,
    this.taskOptions = TaskPopUpMenuOptionEnum.values,
  });

  final String title;
  final List<TaskListEntity> taskList;
  final List<TaskPopUpMenuOptionEnum> taskOptions;
  final OnTaskOptionTapped? onTaskOptionTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textTheme.titleLarge),
          const SizedBox(height: 8.0),
          ...taskList.map(
            (e) => Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Palette.borderColor, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.task),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                e.name,
                                style: textTheme.titleMedium,
                              ),
                              const SizedBox(width: 8.0),
                              Text(e.getLastModifiedText, style: textTheme.bodySmall),
                            ],
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              e.description,
                              style: textTheme.bodySmall,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                    child: PopupMenuButton<TaskPopUpMenuOptionEnum>(
                      padding: EdgeInsets.zero,
                      position: PopupMenuPosition.over,
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) => onTaskOptionTap?.call(value, e.id),
                      itemBuilder: (BuildContext context) {
                        return taskOptions
                            .map(
                              (e) => PopupMenuItem<TaskPopUpMenuOptionEnum>(
                                value: e,
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 120,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                        child: Icon(
                                          e.icon,
                                          size: 16,
                                        ),
                                      ),
                                      Text(e.name, style: textTheme.bodyMedium),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
