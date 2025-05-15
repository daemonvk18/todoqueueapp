import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoqueueapp/bloc/auth/auth_events.dart';
import 'package:todoqueueapp/bloc/auth/auth_states.dart';
import 'package:todoqueueapp/bloc/task/task_events.dart';
import 'package:todoqueueapp/bloc/task/task_states.dart';
import 'package:todoqueueapp/ui/components/task_item.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/task/task_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final userEmail = authState is AuthAuthenticated ? authState.userEmail : '';
    final userId = authState is AuthAuthenticated ? authState.userEmail : '';

    // Trigger loading tasks when the screen is built
    context.read<TaskBloc>().add(LoadTasksEvent(userId));

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          context.go('/login');
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard - $userEmail'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => context.go('/add'),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(SignOutEvent());
              },
              tooltip: 'Logout',
            ),
          ],
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TaskLoaded) {
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(task: state.tasks[index]);
                },
              );
            } else if (state is TaskError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No tasks found'));
          },
        ),
      ),
    );
  }
}
