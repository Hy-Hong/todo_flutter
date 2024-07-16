import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTaskDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void editTask(int index, String newTitle) {
    _tasks[index].title = newTitle;
    notifyListeners();
  }
}
