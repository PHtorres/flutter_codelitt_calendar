import 'package:flutter/material.dart';
import 'package:flutter_codelitt_calendar/widgets/codelitt_logo.dart';
import 'package:provider/provider.dart';
import '../widgets/calendar.dart';

import 'constants/app.dart';
import 'providers/reminders.dart';
import 'screens/add_reminder_screen.dart';
import 'screens/edit_reminder_screen.dart';
import 'screens/reminders_screen.dart';
import 'theme/colors.dart';
import 'theme/theme_data.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reminders = Provider.of<Reminders>(context);
    return MaterialApp(
      title: appTitle,
      theme: themeData,
      initialRoute: RemindersScreen.routeName,
      builder: (context, child) => Scaffold(
        body: Container(
          color: desktopBackgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 50),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CodelittLogo(),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          elevation: 10,
                          shadowColor: shadowColor.withOpacity(0.5),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: child,
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Calendar(
                          onSelectedDateChanged: reminders.setSelectedDate,
                          selectedDate: reminders.selectedDate),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      routes: {
        RemindersScreen.routeName: (_) => RemindersScreen(),
        AddReminderScreen.routeName: (_) => const AddReminderScreen(),
        EditReminderScreen.routeName: (_) => const EditReminderScreen()
      },
    );
  }
}
