import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: Chip(
        label: Text(task.status),
        backgroundColor: task.status == 'queued' ? Colors.orange : Colors.green,
      ),
    );
  }
}
