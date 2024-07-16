import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class EditTaskDialog extends StatelessWidget {
  final int taskIndex;
  final TextEditingController _controller;

  EditTaskDialog({required this.taskIndex, required String initialText})
      : _controller = TextEditingController(text: initialText);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Task'),
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
          child: Text('Save'),
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              Provider.of<TaskProvider>(context, listen: false)
                  .editTask(taskIndex, _controller.text);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
