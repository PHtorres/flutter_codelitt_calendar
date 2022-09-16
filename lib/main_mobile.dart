import 'package:flutter/material.dart';

import 'constants/app.dart';
import 'screens/add_reminder_screen.dart';
import 'screens/edit_reminder_screen.dart';
import 'screens/reminders_screen.dart';
import 'theme/theme_data.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: themeData,
      initialRoute: RemindersScreen.routeName,
      routes: {
        RemindersScreen.routeName: (_) => RemindersScreen(),
        AddReminderScreen.routeName: ((_) => const AddReminderScreen()),
        EditReminderScreen.routeName: ((_) => const EditReminderScreen())
      },
    );
  }
}
