import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_clone/model/task_model.dart';

class Taskprovider extends ChangeNotifier {
  final List<Task> savedtask = [];
  late Box<Task> taskBox;
  Taskprovider() {
    _init();
  }
  Future<void> _init() async {
    taskBox = await Hive.openBox<Task>('taskBox');
    savedtask.addAll(taskBox.values);
    notifyListeners();
  }

  Future<void> addTasktolist(Task task) async {
    savedtask.add(task);
    await taskBox.add(task);
    notifyListeners();
  }
}
