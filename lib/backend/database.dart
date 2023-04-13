import 'package:hive/hive.dart';
import 'package:todo/backend/todo_model.dart';

class Database {
// taking reference of the hive openbox
  final dbBox = Hive.box('Database');

  // writing function to add data in database
  void saveData(List<TodoModel> allTask) {
    List<dynamic> allTaskFormatted = [];

    // for (var tasks in allTask) {
    //   // List<dynamic> TaskFormatted = [tasks.task];
    //   // allTaskFormatted.add(TaskFormatted);

    // }

    for (var tasks in allTask) {
      allTaskFormatted.add(tasks.task);
    }
    dbBox.put('Task_Key', allTaskFormatted);
  }

// Writing function to read data from database
  List<TodoModel> readData() {
    List<dynamic> savedData = dbBox.get('Task_Key') ?? [];
    List<TodoModel> allTask = [];
    for (int i = 0; i < savedData.length; i++) {
      String task = savedData[i];
      TodoModel object = TodoModel(task: task);
      allTask.add(object);
    }
    return allTask;
  }
}
