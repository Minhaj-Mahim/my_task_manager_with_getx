import 'package:get/get.dart';
import 'package:my_task_manager_with_getx/data/data.network_caller/network_caller.dart';
import 'package:my_task_manager_with_getx/data/data.network_caller/network_response.dart';
import 'package:my_task_manager_with_getx/data/data.utility/urls.dart';
import 'package:my_task_manager_with_getx/data/models/task_list_model.dart';

class NewTaskController extends GetxController{

  bool _getNewTaskInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  bool get getNewTaskInProgress => _getNewTaskInProgress;

  TaskListModel get taskListModel => _taskListModel;


  Future<bool> getNewTaskList() async {
    bool isSuccess = false;
    _getNewTaskInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getNewTasks);
    _getNewTaskInProgress = false;
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.jsonResponse);
      isSuccess = true;
    }
    update();
    return isSuccess;
  }
}