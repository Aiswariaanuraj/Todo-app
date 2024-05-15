import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_clone/provider/task_provider.dart';
import 'package:todo_clone/views/loginpage.dart';
import 'package:todo_clone/model/task_model.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appDirectory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

  var box = await Hive.openBox<Task>('taskBox');
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
