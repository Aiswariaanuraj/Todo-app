// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_clone/addtask.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:todo_clone/task_model.dart';
import 'package:todo_clone/task_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<Taskprovider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "TO DO",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: taskProvider.savedtask.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.savedtask[index];

                  Color? tileColor;
                  switch (task.tpriority) {
                    case 'High':
                      tileColor = Colors.orange[200];
                      break;
                    case 'Urgent':
                      tileColor = Colors.red[200];
                      break;
                    case 'Low':
                      tileColor = Colors.yellow[200];
                      break;
                    default:
                      tileColor = Colors.white;
                      break;
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: tileColor,
                      title: Text(task.tname,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                      subtitle: Text(
                        task.tdescription,
                        style: const TextStyle(fontSize: 15),
                      ),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(task.tfrmdate),
                        const SizedBox(width: 10),
                        Text(task.ttodate)
                      ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple[100],
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Addtask()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
