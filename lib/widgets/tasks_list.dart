import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/store/actions/tasks_actions.dart';
import 'package:todoey_flutter/store/reducers/app_reducer.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(builder: (ctx, store) {
      final List<Task> tasks = store.state.tasks;
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            onChanged: (newValue) {
              store.dispatch(ToggleTaskAction(task: tasks[index]));
            },
            onLongPress: () {
              store.dispatch(RemoveTaskAction(task: tasks[index]));
            },
          );
        },
        itemCount: tasks.length,
      );
    });
  }
}
