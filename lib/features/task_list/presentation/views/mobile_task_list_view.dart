import 'package:film_planner/features/task_list/domain/enums/task_list_status_enum.dart';
import 'package:film_planner/features/task_list/presentation/mappers/task_list_state_mapper.dart';
import 'package:film_planner/features/task_list/presentation/mappers/task_list_status_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc/task_list_bloc.dart';
import '../../domain/entities/task_list_entity.dart';
import '../widgets/more_side_bar.dart';
import '../widgets/tasks_list_view_builder.dart';

typedef TaskListSelector = BlocSelector<TaskListBloc, TaskListState, List<TaskListEntity>?>;

class MobileTaskListContentView extends StatelessWidget {
  const MobileTaskListContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(
                child: TaskListSelector(
                  selector: (state) => state.toDoTasks,
                  builder: (context, toDoTasks) => toDoTasks != null
                      ? TasksListViewBuilder(
                          title: TaskListStatusEnum.toDo.toText,
                          taskList: toDoTasks,
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text('Create new task'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
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
              SliverToBoxAdapter(
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
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
        const MoreSideBar(),
      ],
    );
  }
}
