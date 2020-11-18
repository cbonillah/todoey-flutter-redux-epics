import 'package:redux/redux.dart';
import 'package:todoey_flutter/store/epics/epics.dart';
import 'package:todoey_flutter/store/reducers/app_reducer.dart';

export 'reducers/app_reducer.dart';
export 'reducers/tasks_reducer.dart';

final kStore = Store(
  appStateReducer,
  initialState: AppState(),
  middleware: [tasksEpic],
);
