import 'package:redux_epics/redux_epics.dart';
import 'package:todoey_flutter/store/epics/fetch_task_epics.dart';
import 'package:todoey_flutter/store/epics/post_task_epic.dart';
import 'package:todoey_flutter/store/epics/remove_task_epic.dart';
import 'package:todoey_flutter/store/epics/update_task_epics.dart';

final tasksEpic = EpicMiddleware(combineEpics([
  FetchTasksEpic.epic,
  PostTaskEpic.epic,
  RemoveTaskEpic.epic,
  UpdateTaskEpic.epic,
]));
