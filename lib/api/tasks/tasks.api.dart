import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoey_flutter/models/task.dart';

const String kTasksApiUri = 'http://192.168.1.169:3000';

class TasksAPI {
  static Future<List<Task>> fetchTasks() async {
    print('Fetching tasks from $kTasksApiUri/tasks');
    final response = await http.get('$kTasksApiUri/tasks');
    print('Response: \n $response');
    final body = jsonDecode(response.body);
    print('Response body: \n ${response.body}');
    final dynamicTasks = body['tasks'];
    final List<Task> taskList =
        List.from(dynamicTasks).map((e) => Task.fromJson(e)).toList();
    print('Task list: \n $taskList');
    return taskList;
  }

  static Future<Task> toggleTask(final Task task) async {
    try {
      print('Toggling task on $kTasksApiUri/tasks');
      final response = await http.put(
        '$kTasksApiUri/tasks/${task.id}',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': task.id,
          'name': task.name,
          'isDone': !task.isDone,
          'timestamp': task.timestamp,
        }),
      );
      print('Response: \n $response');
      final responseBody = jsonDecode(response.body);
      print('Response body: \n ${response.body}');
      final updatedTask = Task.fromJson(responseBody);
      print('Updated task: \n $updatedTask');
      return updatedTask;
    } catch (e, stack) {
      print(e);
      print(stack);
      throw e;
    }
  }

  static Future<Task> postNewTask(final String taskName) async {
    try {
      print('Posting a new task to $kTasksApiUri/tasks');
      final response = await http.post(
        '$kTasksApiUri/tasks',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': taskName,
          'isDone': false,
        }),
      );
      print('Response: \n $response');
      final responseBody = jsonDecode(response.body);
      print('Response body: \n ${response.body}');
      final newTask = Task.fromJson(responseBody);
      print('New task: \n $newTask');
      return newTask;
    } catch (e, stack) {
      print(e);
      print(stack);
      throw e;
    }
  }

  static Future<Task> removeTask(final Task task) async {
    try {
      print('Removing a task from $kTasksApiUri/tasks');
      final response = await http.delete('$kTasksApiUri/tasks/${task.id}');
      print('Response: \n $response');
      final responseBody = jsonDecode(response.body);
      print('Response body: \n ${response.body}');
      final removedTask = Task.fromJson(responseBody);
      print('Removed task: \n $removedTask');
      return removedTask;
    } catch (e, stack) {
      print(e);
      print(stack);
      throw e;
    }
  }
}
