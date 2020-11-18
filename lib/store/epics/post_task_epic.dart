import 'package:flutter/cupertino.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todoey_flutter/api/tasks/tasks.api.dart';
import 'package:todoey_flutter/store/actions/tasks_actions.dart';
import 'package:todoey_flutter/store/reducers/app_reducer.dart';

abstract class PostTaskEpic {
  static final epic = TypedEpic<AppState, AddTaskAction>(handleAddTaskEpic);

  static Stream<dynamic> handleAddTaskEpic(
    Stream<AddTaskAction> actions,
    EpicStore<AppState> store,
  ) {
    return actions.asyncMap((action) => TasksAPI.postNewTask(action.task.name)
        .then<dynamic>((task) => FetchTasksAction())
        .catchError(_addTasksErrorHandle));
  }

  static dynamic _addTasksErrorHandle(error, trace) {
    debugPrintStack(stackTrace: trace);
    return AddTaskFailureAction();
  }
}
