import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatefulWidget {
  final String value;
  final void Function(BuildContext)? deleteTask;
  const TaskTile({required this.value, required this.deleteTask, super.key});

  @override
  State<TaskTile> createState() => TaskTileState();
}

class TaskTileState extends State<TaskTile> {
  bool compleated = false;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: widget.deleteTask,
          label: 'Delete',
          icon: Icons.delete,
          borderRadius: BorderRadius.circular(5),
          backgroundColor: Colors.red,
        ),
        SlidableAction(
          onPressed: (context) {
            compleated = false;
            setState(() {});
          },
          label: 'Unmark',
          icon: Icons.close_rounded,
          borderRadius: BorderRadius.circular(5),
          backgroundColor: Colors.blue,
        )
      ]),
      startActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            compleated = true;
            setState(() {});
          },
          label: 'Compleated',
          icon: Icons.done,
          borderRadius: BorderRadius.circular(5),
          backgroundColor: Colors.green,
        ),
      ]),
      child: ListTile(
        title: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blue[300], borderRadius: BorderRadius.circular(5)),
          child: compleated
              ? Text(widget.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red))
              : Text(widget.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  )),
        ),
        textColor: Colors.black54,
      ),
    );
  }
}
