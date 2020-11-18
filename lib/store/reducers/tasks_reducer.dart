import 'package:redux/redux.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/store/actions/tasks_actions.dart';

// Add tasks

List<Task> addTaskActionReducer(List<Task> tasks, AddTaskAction action) {
  return List.from(tasks)..add(action.task);
}

List<Task> addTaskActionFailureReducer(
    List<Task> tasks, AddTaskFailureAction action) {
  return tasks;
}

// Remove tasks

List<Task> removeTaskActionReducer(
    final List<Task> tasks, final RemoveTaskAction action) {
  return List<Task>.from(tasks).where((t) => t.id != action.task.id).toList();
}

List<Task> removeTaskActionFailureReducer(
    List<Task> tasks, RemoveTaskFailureAction action) {
  return tasks;
}

List<Task> removeTaskActionSuccessReducer(
    List<Task> tasks, RemoveTaskSuccessAction action) {
  return tasks;
}

// Fetch tasks

List<Task> fetchTasksActionReducer(List<Task> tasks, FetchTasksAction action) {
  return tasks;
}

List<Task> fetchTasksActionFailureReducer(
    List<Task> tasks, FetchTasksFailureAction action) {
  return tasks;
}

List<Task> fetchTasksActionSuccessReducer(
    List<Task> tasks, FetchTasksSuccessAction action) {
  return List.from(action.tasks);
}

// Toggle tasks
List<Task> toggleTaskActionReducer(
    final List<Task> tasks, final ToggleTaskAction action) {
  return List<Task>.from(tasks).map((t) {
    if (t.id == action.task.id) {
      return Task(
          id: action.task.id,
          name: action.task.name,
          isDone: !action.task.isDone,
          timestamp: action.task.timestamp);
    }
    return t;
  }).toList();
}

List<Task> toggleTaskActionFailureReducer(
    List<Task> tasks, ToggleTaskFailureAction action) {
  return tasks;
}

List<Task> toggleTaskActionSuccessReducer(
    List<Task> tasks, ToggleTaskSuccessAction action) {
  return tasks;
}

Reducer<List<Task>> tasksReducer = combineReducers([
  // Add tasks
  TypedReducer<List<Task>, AddTaskAction>(addTaskActionReducer),
  TypedReducer<List<Task>, AddTaskFailureAction>(addTaskActionFailureReducer),
  // Remove tasks
  TypedReducer<List<Task>, RemoveTaskAction>(removeTaskActionReducer),
  TypedReducer<List<Task>, RemoveTaskFailureAction>(
      removeTaskActionFailureReducer),
  TypedReducer<List<Task>, RemoveTaskSuccessAction>(
      removeTaskActionSuccessReducer),
  // Fetch tasks
  TypedReducer<List<Task>, FetchTasksAction>(fetchTasksActionReducer),
  TypedReducer<List<Task>, FetchTasksFailureAction>(
      fetchTasksActionFailureReducer),
  TypedReducer<List<Task>, FetchTasksSuccessAction>(
      fetchTasksActionSuccessReducer),
  // Toggle tasks
  TypedReducer<List<Task>, ToggleTaskAction>(toggleTaskActionReducer),
  TypedReducer<List<Task>, ToggleTaskFailureAction>(
      toggleTaskActionFailureReducer),
  TypedReducer<List<Task>, ToggleTaskSuccessAction>(
      toggleTaskActionSuccessReducer),
]);
