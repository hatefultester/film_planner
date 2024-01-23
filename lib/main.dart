import 'package:film_planner/config/di.dart';
import 'package:film_planner/config/palette.dart';
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
      theme: ThemeData.dark(
        useMaterial3: false,
      ).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Palette.backgroundColor,
          elevation: 0,
          shape: Border(
            bottom: BorderSide(
              color: Palette.borderColor,
              width: 2,
            ),
          ),
          titleTextStyle: TextStyle(
            color: Palette.onPrimaryColor,
            fontSize: 32,
          ),
          toolbarHeight: 64,
        ),
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Palette.borderColor,
              width: 2,
            ),
          ),
          position: PopupMenuPosition.over,
          color: Palette.popupMenuColor,
        ),
        scaffoldBackgroundColor: Palette.backgroundColor,
        primaryColor: Palette.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const PlatformWrapper(
        child: TaskListPage(),
      ),
    );
  }
}
