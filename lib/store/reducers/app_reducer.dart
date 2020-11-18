import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/store/store.dart';

class AppState {
  final List<Task> tasks;

  AppState({this.tasks = const []});
}

AppState appStateReducer(AppState state, action) {
  return AppState(
    tasks: tasksReducer(state.tasks, action),
  );
}
