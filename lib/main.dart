import 'package:film_planner/config/di.dart';
import 'package:film_planner/features/core/presentation/widgets/platform_wrapper.dart';
import 'package:film_planner/features/task_list/presentation/pages/task_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injection();
  runApp(const FilmPlannerApp());
}

class FilmPlannerApp extends StatelessWidget {
  const FilmPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Planner',
      theme: ThemeData.dark(),
      home: const PlatformWrapper(
        child: TaskListPage(),
      ),
    );
  }
}
