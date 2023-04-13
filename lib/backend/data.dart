import 'package:flutter/material.dart';
import 'package:todo/backend/database.dart';
import 'package:todo/backend/todo_model.dart';

class TodoData with ChangeNotifier {
  // This is the list where we add task data or delete data .
  List<TodoModel> taskList = [];

//  This is the function which return that taskList
  List<TodoModel> OverallList() {
    return taskList;
  }

// Getting data from database if exists
  var db = Database();
  void getData() {
    if (db.readData().isNotEmpty) {
      taskList = db.readData();
    }
  }
// Function to add new task in taskList

  addTask(TodoModel task) {
    taskList.add(task);
    db.saveData(taskList);
    notifyListeners();
  }

// Function to delete task from taskList
  void deleteTask(TodoModel task) {
    taskList.remove(task);
    db.saveData(taskList);
    notifyListeners();
  }
}
