import 'package:flutter/cupertino.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:todoey_flutter/api/tasks/tasks.api.dart';
import 'package:todoey_flutter/store/actions/tasks_actions.dart';
import 'package:todoey_flutter/store/reducers/app_reducer.dart';

abstract class FetchTasksEpic {
  static final epic =
      TypedEpic<AppState, FetchTasksAction>(handleFetchTasksEpic);

  static Stream<dynamic> handleFetchTasksEpic(
    Stream<FetchTasksAction> actions,
    EpicStore<AppState> store,
  ) {
    return actions.asyncMap((action) => TasksAPI.fetchTasks()
        .then<dynamic>((tasks) => FetchTasksSuccessAction(tasks: tasks))
        .catchError(_fetchTasksErrorHandle));
  }

  static dynamic _fetchTasksErrorHandle(error, trace) {
    debugPrintStack(stackTrace: trace);
    return FetchTasksFailureAction();
  }
}
