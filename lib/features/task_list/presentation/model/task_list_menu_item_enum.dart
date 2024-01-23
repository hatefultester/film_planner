import 'package:flutter/material.dart';

enum TaskListMenuItemEnum {
  tasks('Tasks', Icons.list_alt_outlined),
  user('User', Icons.person_2),
  ;

  const TaskListMenuItemEnum(this.label, this.iconData);

  final String label;
  final IconData iconData;
}