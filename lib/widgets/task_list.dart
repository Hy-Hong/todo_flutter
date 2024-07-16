import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import 'task_item.dart';
import 'edit_task_dialog.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (context, index) {
            return TaskItem(
              task: taskProvider.tasks[index],
              onDelete: () => taskProvider.deleteTask(index),
              onToggleDone: () => taskProvider.toggleTaskDone(index),
              onEdit: () {
                showDialog(
                  context: context,
                  builder: (context) => EditTaskDialog(
                    taskIndex: index,
                    initialText: taskProvider.tasks[index].title,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
