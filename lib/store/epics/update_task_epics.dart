import 'package:flutter/cupertino.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todoey_flutter/api/tasks/tasks.api.dart';
import 'package:todoey_flutter/store/actions/tasks_actions.dart';
import 'package:todoey_flutter/store/reducers/app_reducer.dart';

abstract class UpdateTaskEpic {
  static final epic = TypedEpic<AppState, ToggleTaskAction>(toggleTaskEpic);

  static Stream<dynamic> toggleTaskEpic(
    Stream<ToggleTaskAction> actions,
    EpicStore<AppState> store,
  ) {
    return actions.asyncMap((action) => TasksAPI.toggleTask(action.task)
        .then<dynamic>((task) => ToggleTaskSuccessAction(task: task))
        .catchError(_updateTaskErrorHandle));
  }

  static dynamic _updateTaskErrorHandle(error, trace) {
    debugPrintStack(stackTrace: trace);
    return ToggleTaskFailureAction();
  }
}
