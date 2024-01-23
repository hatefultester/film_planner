import 'package:film_planner/config/constants.dart';
import 'package:film_planner/features/task_list/presentation/mappers/task_list_state_mapper.dart';
import 'package:film_planner/features/task_list/presentation/mappers/task_list_status_mapper.dart';
import 'package:film_planner/features/task_list/presentation/widgets/tasks_list_menu.dart';
import 'package:flutter/material.dart';

import '../../domain/enums/task_list_status_enum.dart';
import '../widgets/more_side_bar.dart';
import '../widgets/tasks_list_view_builder.dart';
import 'mobile_task_list_view.dart';

class DesktopTaskListContentView extends StatelessWidget {
  const DesktopTaskListContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TaskListMenu(),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TaskListSelector(
                              selector: (state) => state.toDoTasks,
                              builder: (context, toDoTasks) => toDoTasks != null
                                  ? TasksListViewBuilder(
                                      title: TaskListStatusEnum.toDo.toText,
                                      taskList: toDoTasks,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => {},
                                  child: const Text('Create new task'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TaskListSelector(
                          selector: (state) => state.onProcessTasks,
                          builder: (context, onProcessTasks) => onProcessTasks != null
                              ? TasksListViewBuilder(
                                  title: TaskListStatusEnum.onProcess.toText,
                                  taskList: onProcessTasks,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                      Expanded(
                        child: TaskListSelector(
                          selector: (state) => state.finishedTasks,
                          builder: (context, finishedTasks) => finishedTasks != null
                              ? TasksListViewBuilder(
                                  title: TaskListStatusEnum.finished.toText,
                                  taskList: finishedTasks,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const MoreSideBar(
          padding: EdgeInsets.only(left: Constants.taskListMenuWidth - 8),
        ),
      ],
    );
  }
}
