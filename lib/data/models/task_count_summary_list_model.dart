import 'package:my_task_manager_with_getx/data/models/task_count.dart';

class TaskCountSummaryListModel {
  String? status;
  List<TaskCount>? taskCountList;

  TaskCountSummaryListModel({this.status, this.taskCountList});

  TaskCountSummaryListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskCountList = <TaskCount>[];
      json['data'].forEach((v) {
        taskCountList!.add(TaskCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (taskCountList != null) {
      data['data'] = taskCountList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}