import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_clone/provider/task_provider.dart';
import 'package:todo_clone/views/loginpage.dart';
import 'package:todo_clone/model/task_model.dart';

void main() async {
  await Hive.initFlutter();

  var Box = await Hive.openBox<Task>('taskBox');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Taskprovider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TO DO",
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.purple[100]),
          scaffoldBackgroundColor: Colors.grey[200],
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.purple[100])))
          // buttonTheme: ButtonThemeData(buttonColor: Colors.amber[200]),
          ),
      home: const Loginpage(),
    );
  }
}
