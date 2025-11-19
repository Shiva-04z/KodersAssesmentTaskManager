import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import '../features/tasks/presentation/pages/add_edit_task_page.dart'; // Import your page

class QuickActionsHandler {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final QuickActions quickActions = QuickActions();



  static Future<void> initialize() async {
    try {
      await quickActions.initialize((String shortcutType) {
        _handleQuickAction(shortcutType);
      });

      await quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
          type: 'add_tasks',
          localizedTitle: 'Add New Task',
          icon:Platform.isIOS ? 'plus' : 'add_tasks',
        ),
      ShortcutItem(
          type: 'view_tasks',
          localizedTitle: 'View Tasks',
          icon:Platform.isIOS ? 'plus' : 'view_tasks',
        ),
      ]);

      print('Quick actions initialized');
    } catch (e) {
      print('Error initializing quick actions: $e');
    }
  }

  static void _handleQuickAction(String shortcutType) {
    Future.delayed(const Duration(milliseconds: 100), () {
      final navigator = navigatorKey.currentState;
      if (navigator == null) return;

      switch (shortcutType) {
        case 'add_task':

          navigator.push(MaterialPageRoute(
            builder: (context) => const AddEditTaskPage(),
          ));
          break;
        case 'view_tasks':

          navigator.popUntil((route) => route.isFirst);
          break;
      }
    });
  }

}
