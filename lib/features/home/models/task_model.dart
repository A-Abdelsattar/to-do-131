
import 'dart:ui';

import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel{
  @HiveField(0)
  String title;
  @HiveField(1)
  String startTime;
  @HiveField(2)
  String endTime;
  @HiveField(3)
  String description;
  @HiveField(4)
  String statusText;
  @HiveField(5)
  int color;

  TaskModel({required this.title, required this.startTime, required this.endTime, required this.description,
    required this.statusText, required this.color});

}

List<TaskModel> allTasks=[
];