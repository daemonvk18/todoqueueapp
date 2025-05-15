import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoqueueapp/bloc/auth/auth_bloc.dart';
import 'package:todoqueueapp/bloc/auth/auth_states.dart';
import 'package:todoqueueapp/bloc/task/task_events.dart';
import '../../bloc/task/task_bloc.dart';
import 'package:go_router/go_router.dart';

class TaskCreatorScreen extends StatefulWidget {
  const TaskCreatorScreen({super.key});

  @override
  State<TaskCreatorScreen> createState() => _TaskCreatorScreenState();
}

class _TaskCreatorScreenState extends State<TaskCreatorScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthBloc>().state is AuthAuthenticated
        ? (context.read<AuthBloc>().state as AuthAuthenticated).userEmail
        : '';

    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<TaskBloc>().add(
                      AddTaskEvent(
                        _titleController.text,
                        _descriptionController.text,
                        userId,
                      ),
                    );
                context.go('/dashboard');
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
