// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_clone/addtask.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:todo_clone/task_model.dart';

class Homepage extends StatefulWidget {
  final List<Task> savedtask;
  const Homepage({super.key, required this.savedtask});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _ischeck = false;

  @override
  Widget build(BuildContext context) {
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
                itemCount: widget.savedtask.length,
                itemBuilder: (context, index) {
                  final task = widget.savedtask[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: Colors.white,
                      leading: Checkbox(
                        value: _ischeck,
                        onChanged: (value) {
                          setState(() {
                            _ischeck = value!;
                          });
                        },
                      ),
                      title: Text(task.tname),
                      subtitle: Text(task.tdescription),
                      trailing: Row(
                          children: [Text(task.tfrmdate), Text(task.ttodate)]),

                      // Add more ListTile properties to display additional task details
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        // ListView.builder(
        //   itemCount: 3,
        //   itemBuilder: (context, index) {
        //     return const Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: ListTile(
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(10))),
        //         //   leading: Checkbox(value:_ischeck, onChanged:((value)
        //         //  {setState(() {
        //         //   _ischeck=value!;
        //         // });

        //         // }),
        //         contentPadding: EdgeInsets.all(10),
        //         title: Text("Task"),
        //         subtitle: Text("Task description"),
        //         trailing: Column(
        //           children: [
        //             Text("From"),
        //             Text("To"),
        //           ],
        //         ),
        //         tileColor: Colors.white,
        //       ),
        //     );
        //   },
        // ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber[200],
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Addtask()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
