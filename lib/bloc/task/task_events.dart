abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String title;
  final String description;
  final String userId;
  AddTaskEvent(this.title, this.description, this.userId);
}

class LoadTasksEvent extends TaskEvent {
  final String userId;
  LoadTasksEvent(this.userId);
}
