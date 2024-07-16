import 'package:flutter/material.dart';
import '../models/task.dart';
import 'edit_task_dialog.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onToggleDone;
  final VoidCallback onEdit;

  TaskItem({
    required this.task,
    required this.onDelete,
    required this.onToggleDone,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(task.isDone ? Icons.check_box : Icons.check_box_outline_blank),
            onPressed: onToggleDone,
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
