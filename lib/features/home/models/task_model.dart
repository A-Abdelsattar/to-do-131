

import 'dart:ui';

import 'package:flutter/material.dart' show Colors;

class TaskModel{
  String title;
  String startTime;
  String endTime;
  String description;
  String statusText;
  Color color;

  TaskModel({required this.title, required this.startTime, required this.endTime, required this.description,
    required this.statusText, required this.color});

}

List<TaskModel> allTasks=[
];