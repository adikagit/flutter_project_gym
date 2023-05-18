import 'package:adigym/db/db_helper.dart';
import 'package:adigym/screeens/calendar/logic/models/task.dart';
import 'package:get/get.dart';
import 'dart:typed_data';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTask();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper.delete(task);
  }

  Future<int?> updateTask(Task task) async {
    return await DBHelper.updateTask(task);
  }

  Future<void> updateTaskRaw(String exerciseStatus, int id) async {
    return await DBHelper.updateTaskRaw(exerciseStatus, id);
  }

  Future<void> updatePhotoRaw(Uint8List photo, int id) async {
    return await DBHelper.updatePhotoRaw(photo, id);
  }

  // void deleteAll() {
  //   DBHelper.deleteAll();
  // }
}
