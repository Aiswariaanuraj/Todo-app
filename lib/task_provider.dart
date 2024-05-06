import 'package:flutter/material.dart';
import 'package:todo_clone/task_model.dart';

class Taskprovider extends ChangeNotifier {
  final List<Task> savedtask = [];
  void addTasktolist(Task task) {
    savedtask.add(task);
    notifyListeners();
  }
}
