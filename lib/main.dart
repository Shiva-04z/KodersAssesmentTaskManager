import 'package:flutter/material.dart';
import 'package:taskmanager/app/quick_actions_handler.dart';


import 'app/app.dart';
import 'features/tasks/tasks_injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await QuickActionsHandler.initialize();
  runApp(const TaskManagerApp());
}