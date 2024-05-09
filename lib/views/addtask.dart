import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_clone/common_widget/common_calender.dart';
import 'package:todo_clone/common_widget/common_textfields.dart';

import 'package:todo_clone/model/task_model.dart';
import 'package:todo_clone/provider/task_provider.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  final List<String> prioritylist = ['High', 'Low', 'Urgent'];

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<Taskprovider>(context);
    TextEditingController taskcontroller = TextEditingController();
    TextEditingController taskdescriptioncontroller = TextEditingController();
    String selected = prioritylist[0];
    TextEditingController frmdatecontroller = TextEditingController();
    TextEditingController todatecontroller = TextEditingController();

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
          Customtextfield(taskcontroller: taskcontroller, hint: "task name"),
          Customtextfield(
            taskcontroller: taskdescriptioncontroller,
            hint: "task description",
            maxline: 3,
            maxleng: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButtonFormField<String>(
              value: selected,
              items: prioritylist
                  .map((priority) => DropdownMenuItem(
                        value: priority,
                        child: Text(priority),
                      ))
                  .toList(),
              onChanged: (value) {
                selected = value!;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Priority',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Commoncalender(
                  datecontroller: frmdatecontroller,
                  hint: "From",
                ),
                const Spacer(),
                Commoncalender(
                  datecontroller: todatecontroller,
                  hint: "To",
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final task = taskcontroller.text.toLowerCase();
              final taskdescription = taskdescriptioncontroller.text;
              final taskprioroty = selected;
              final taskfrm = frmdatecontroller.text;
              final taskto = todatecontroller.text;
              if (task.isEmpty || taskfrm.isEmpty || taskto.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Fill the Field"),
                ));

                return;
              }
              final newtask = Task(
                  tname: task,
                  tdescription: taskdescription,
                  tpriority: taskprioroty,
                  tfrmdate: taskfrm,
                  ttodate: taskto);
              taskProvider.addTasktolist(newtask);
              setState(() {
                taskcontroller.clear();
                taskdescriptioncontroller.clear();
                frmdatecontroller.clear();
                todatecontroller.clear();
              });
            },
            child: const Text("Add Task"),
          ),
        ],
      ),

      // if (savedtask.isNotEmpty)
      //   {
      //     ListView.builder(
      //       itemCount: savedtask.length,
      //       itemBuilder: (context, index) {
      //         final task = savedtask[index];
      //         return Container(width

      //           Column(
      //             children: [
      //               Text(task.tname),

      //            Text(task.tdescription),
      //             ],
      //           ),
      //         );
      //       },
      //     )
      //   }
    );
  }
}

// class Displaywidget extends StatefulWidget {
//   const Displaywidget({
//     super.key,
//     required this.savedtask,
//   });

//   final List<Task> savedtask;

//   @override
//   State<Displaywidget> createState() => _DisplaywidgetState();
// }

// class _DisplaywidgetState extends State<Displaywidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: widget.savedtask.length,
//         itemBuilder: (context, index) {
//           final task = widget.savedtask[index];
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               tileColor: Colors.white,
//               title: Text(task.tname),
//               subtitle: Text(task.tdescription),
//               
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
