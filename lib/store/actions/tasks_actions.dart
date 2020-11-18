import 'package:todoey_flutter/models/task.dart';

class AddTaskAction {
  final Task task;

  AddTaskAction({this.task});
}

class AddTaskFailureAction {
  final Task task;
  final String message;

  AddTaskFailureAction({this.task, this.message});
}

class ToggleTaskAction {
  final Task task;

  ToggleTaskAction({this.task});
}

class ToggleTaskSuccessAction {
  final Task task;

  ToggleTaskSuccessAction({this.task});
}

class ToggleTaskFailureAction {
  final String message;

  ToggleTaskFailureAction({this.message});
}

class RemoveTaskAction {
  final Task task;

  RemoveTaskAction({this.task});
}

class RemoveTaskSuccessAction {
  final Task task;

  RemoveTaskSuccessAction({this.task});
}

class RemoveTaskFailureAction {
  final Task task;
  final String message;

  RemoveTaskFailureAction({this.task, this.message});
}

class FetchTasksAction {}

class FetchTasksSuccessAction {
  final List<Task> tasks;

  FetchTasksSuccessAction({this.tasks});
}

class FetchTasksFailureAction {
  final String message;

  FetchTasksFailureAction({this.message});
}
