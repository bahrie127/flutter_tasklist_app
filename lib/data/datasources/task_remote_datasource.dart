import 'package:flutter_tasklist_app/data/models/add_task_request_model.dart';
import 'package:flutter_tasklist_app/data/models/add_task_response_model.dart';
import 'package:flutter_tasklist_app/data/models/task_response_model.dart';
import 'package:http/http.dart' as http;

class TaskRemoteDatasource {
  Future<TasksResponseModel> getTasks() async {
    final response = await http.get(
      Uri.parse('https://fic9.flutterdev.my.id/api/tasks'),
    );
    if (response.statusCode == 200) {
      return TasksResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<AddTaskResponseModel> addTask(AddTaskRequestModel data) async {
    final response = await http.post(
      Uri.parse('https://fic9.flutterdev.my.id/api/tasks'),
      body: data.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return AddTaskResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to add task');
    }
  }

  Future<AddTaskResponseModel> deleteTask(int id) async {
    final response = await http.delete(
      Uri.parse('https://fic9.flutterdev.my.id/api/tasks/$id'),
    );
    if (response.statusCode == 200) {
      return AddTaskResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to delete task');
    }
  }

  Future<AddTaskResponseModel> updateTask(
      int id, AddTaskRequestModel data) async {
    final response = await http.put(
      Uri.parse('https://fic9.flutterdev.my.id/api/tasks/$id'),
      body: data.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return AddTaskResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to update task');
    }
  }
}
