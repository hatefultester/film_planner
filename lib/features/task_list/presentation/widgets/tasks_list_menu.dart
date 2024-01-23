import 'package:film_planner/config/constants.dart';
import 'package:film_planner/features/task_list/presentation/model/task_list_menu_item_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/palette.dart';

typedef TaskListMenuCallback = void Function(TaskListMenuItemEnum);

class TaskListMenu extends StatelessWidget {
  const TaskListMenu({
    this.menuItems = TaskListMenuItemEnum.values,
    super.key,
    this.onMenuItemTapped,
  });

  final List<TaskListMenuItemEnum> menuItems;
  final TaskListMenuCallback? onMenuItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.taskListMenuWidth,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Palette.borderColor,
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: [
          ...menuItems.map(
            (e) => Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Palette.borderColor, width: 1),
              ),
              child: IconButton(
                onPressed: () => onMenuItemTapped?.call(e),
                icon: Icon(e.iconData),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
