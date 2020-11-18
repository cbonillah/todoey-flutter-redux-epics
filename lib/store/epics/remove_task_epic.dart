import 'package:flutter/cupertino.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todoey_flutter/api/tasks/tasks.api.dart';
import 'package:todoey_flutter/store/actions/tasks_actions.dart';
import 'package:todoey_flutter/store/reducers/app_reducer.dart';

abstract class RemoveTaskEpic {
  static final epic =
      TypedEpic<AppState, RemoveTaskAction>(handleRemoveTaskEpic);

  static Stream<dynamic> handleRemoveTaskEpic(
    Stream<RemoveTaskAction> actions,
    EpicStore<AppState> store,
  ) {
    return actions.asyncMap((action) => TasksAPI.removeTask(action.task)
        .then<dynamic>((task) => RemoveTaskSuccessAction(task: task))
        .catchError(_removeTasksErrorHandle));
  }

  static dynamic _removeTasksErrorHandle(error, trace) {
    debugPrintStack(stackTrace: trace);
    return RemoveTaskFailureAction();
  }
}
