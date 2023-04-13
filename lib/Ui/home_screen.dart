import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Ui/taskTile.dart';
import 'package:todo/backend/todo_model.dart';

import '../backend/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  TextEditingController taskcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoData>(context, listen: false).getData();
  }

  addTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleDialog(
                contentPadding: const EdgeInsets.all(8),
                title: const Text(
                  'Add Task',
                  style: TextStyle(color: Colors.black54),
                ),
                backgroundColor: Colors.blue[200],
                children: [
                  TextField(
                    controller: taskcontroller,
                    decoration: InputDecoration(
                        hintText: 'Add new task',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: cancel, child: const Text('Cancel')),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(onPressed: save, child: const Text('Save'))
                    ],
                  )
                ],
              ),
            ],
          );
        }));
  }

  void save() {
    if (taskcontroller.text.isNotEmpty) {
      TodoModel object = TodoModel(task: taskcontroller.text);
      Provider.of<TodoData>(context, listen: false).addTask(object);
    }
    taskcontroller.clear();
    Navigator.pop(context);
  }

  void cancel() {
    taskcontroller.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.blue[400],
          floatingActionButton: FloatingActionButton(
            onPressed: addTask,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
          appBar: AppBar(
            title: const Text('Work To Do',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.w700)),
            centerTitle: true,
            backgroundColor: Colors.blue[300],
          ),
          body: SafeArea(
              child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   padding: EdgeInsets.all(10),
              //   width: 175,
              //   decoration: BoxDecoration(
              //       color: Colors.blue[200],
              //       borderRadius: BorderRadius.circular(5)),
              //   child: Text('Work To Do',
              //       style: TextStyle(
              //           color: Colors.teal[800],
              //           fontSize: 30,
              //           fontWeight: FontWeight.w700)),
              // ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: value.OverallList().length,
                    itemBuilder: (context, index) {
                      return TaskTile(
                        value: value.OverallList()[index].task,
                        deleteTask: (p0) =>
                            value.deleteTask(value.OverallList()[index]),
                      );
                    }),
              ),
            ],
          )),
        );
      },
    );
  }
}
