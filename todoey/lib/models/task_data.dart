import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/models/task.dart';
import 'dart:collection';

String _taskKey = 'task_list';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle,
      {bool isDone = false, bool saveAfterAdd = true}) {
    _tasks.add(Task(newTaskTitle, isDone: isDone));
    notifyListeners();
    if (saveAfterAdd) {
      save();
    }
  }

  String getTaskName(int index) {
    return _tasks[index].name;
  }

  bool isTaskDone(int index) {
    return _tasks[index].isDone;
  }

  void updateTask(int index) {
    this._tasks[index].toggleDone();
    notifyListeners();
    save(task: this._tasks[index]);
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
    save();
  }

  List<String> get taskName {
    return _tasks.map((e) => e.name).toList();
  }

  save({Task? task}) async {
    final prefs = await SharedPreferences.getInstance();

    if (task != null) {
      prefs.setBool(task.name, task.isDone);
      return;
    }

    final List<String> value = this.taskName;
    prefs.setStringList(_taskKey, value);

    _tasks.forEach((task) {
      print('Save - ${task.name}: ${task.isDone}');
      prefs.setBool(task.name, task.isDone);
    });
  }

  load() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> tasks = prefs.getStringList(_taskKey) ?? [];

    tasks.forEach((taskName) {
      addTask(taskName,
          isDone: prefs.getBool(taskName) ?? false, saveAfterAdd: false);
    });

    _tasks.forEach((element) {
      print('Load - ${element.name}: ${element.isDone}');
    });
  }
}
