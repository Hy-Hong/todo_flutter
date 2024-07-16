import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class AddTaskDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(labelText: 'Task title'),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Add'),
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              Provider.of<TaskProvider>(context, listen: false)
                  .addTask(_controller.text);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
