import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/app.dart';
import 'main_desktop.dart';
import 'main_mobile.dart';
import 'providers/reminders.dart';

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
      child: isDesktop ? const MainDesktop() : const MainMobile(),
    );
  }
}
