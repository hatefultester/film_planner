import 'package:flutter/material.dart';

enum TaskPopUpMenuOptionEnum {
  share('Share', Icons.share),
  edit('Edit', Icons.edit),
  delete('Delete', Icons.delete),
  ;

  const TaskPopUpMenuOptionEnum(this.name, this.icon);

  final String name;
  final IconData icon;
}
