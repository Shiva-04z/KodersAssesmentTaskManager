import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/app/quick_actions_handler.dart';
import '../features/core/theme/app_theme.dart';
import '../features/tasks/presentation/bloc/task/task_bloc.dart';
import '../features/tasks/presentation/bloc/task/task_event.dart';
import '../features/tasks/presentation/bloc/theme/theme_bloc.dart';
import '../features/tasks/presentation/pages/task_list_page.dart';
import '../features/tasks/tasks_injection_container.dart' as di;

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()..add(ThemeLoaded())),
        BlocProvider(create: (context) => di.sl<TaskBloc>()..add(LoadTasks())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Task Manager',
            theme: AppTheme.getTheme(themeState.themeType),
            home: const TaskListPage(),
            navigatorKey: QuickActionsHandler.navigatorKey,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}