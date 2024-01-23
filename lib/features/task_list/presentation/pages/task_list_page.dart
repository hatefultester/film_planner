import 'package:film_planner/features/core/application/platform_bloc.dart';
import 'package:film_planner/features/task_list/application/bloc/task_list_bloc.dart';
import 'package:film_planner/features/task_list/presentation/views/desktop_task_list_view.dart';
import 'package:film_planner/features/task_list/presentation/views/mobile_task_list_view.dart';
import 'package:film_planner/features/task_list/presentation/widgets/help_icon_button.dart';
import 'package:film_planner/features/task_list/presentation/widgets/message_floating_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskListBloc>(
      create: (context) => sl<TaskListBloc>()..add(const GetTaskListEvent(userId: 'userId')),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Film Planner'),
          centerTitle: false,
          actions: [
            HelpIconButton(
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<TaskListBloc, TaskListState>(
          buildWhen: (previous, current) => previous != current && previous.runtimeType != current.runtimeType,
          builder: (context, taskListState) {
            if (taskListState is LoadingTaskListState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return BlocBuilder<PlatformBloc, PlatformState>(
              builder: (context, platformState) => switch (platformState) {
                MobilePlatformState() => const MobileTaskListContentView(),
                DesktopPlatformState() => const DesktopTaskListContentView(),
              },
            );
          },
        ),
        floatingActionButton: MessageFloatingIcon(
          onPressed: () {},
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      ),
    );
  }
}
