import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoqueueapp/bloc/task/task_events.dart';
import 'package:todoqueueapp/bloc/task/task_states.dart';
import 'package:todoqueueapp/data/repos/task_repo.dart';
import '../../data/models/task_model.dart';

import 'package:uuid/uuid.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;

  TaskBloc(this._taskRepository) : super(TaskInitial()) {
    on<AddTaskEvent>((event, emit) async {
      try {
        final task = Task(
          id: const Uuid().v4(),
          title: event.title,
          description: event.description,
          status: 'queued',
          userId: event.userId,
        );
        await _taskRepository.addTask(task);
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

    on<LoadTasksEvent>((event, emit) async {
      emit(TaskLoading());
      try {
        final stream = _taskRepository.getTasks(event.userId);
        await for (final tasks in stream) {
          emit(TaskLoaded(tasks));
        }
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
  }
}
