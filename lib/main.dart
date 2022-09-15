import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/reminders.dart';
import 'screens/add_reminder_screen.dart';
import 'screens/edit_reminder_screen.dart';
import 'screens/reminders_screen.dart';
import 'theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Reminders(),
      child: MaterialApp(
        title: 'Codelitt Calendar',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            //primarySwatch: Colors.blue,
            //buttonTheme: ButtonThemeData(buttonColor: Colors.amber),
            //elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),)),
            textSelectionTheme:
                const TextSelectionThemeData(cursorColor: primaryColor),
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
              floatingLabelStyle: TextStyle(fontSize: 16, color: primaryColor),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)),
            ),
            primaryColor: primaryColor),
        initialRoute: RemindersScreen.routeName,
        routes: {
          RemindersScreen.routeName: (_) => RemindersScreen(),
          AddReminderScreen.routeName: ((_) => const AddReminderScreen()),
          EditReminderScreen.routeName: ((_) => const EditReminderScreen())
        },
      ),
    );
  }
}
