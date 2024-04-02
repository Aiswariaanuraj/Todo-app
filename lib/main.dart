import 'package:flutter/material.dart';
import 'package:todo_clone/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TO DO",
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.amber[200]),
          scaffoldBackgroundColor: Colors.grey[200],
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber[200])))
          // buttonTheme: ButtonThemeData(buttonColor: Colors.amber[200]),
          ),
      home: const Loginpage(),
    );
  }
}
