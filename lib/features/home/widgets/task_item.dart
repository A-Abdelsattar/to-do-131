import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/models/task_model.dart';


class TaskItem extends StatelessWidget {
  final TaskModel task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: task.color
      ),
      child: Row(
        children: [
          Expanded(child: Column(
            spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start
          ,
          children: [
            Text(task.title,style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
            Text("${task.startTime} | ${task.endTime}",style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white
            ),),
            Text(task.description,style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white
            ),),

          ],)),
          Container(
            color: Colors.grey,
            width: 1.w,
            height: 100.h,
          ),
          SizedBox(width: 10.w,),
          RotatedBox(
            quarterTurns: 3,
            child: Text(task.statusText,style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
          )
        ],
      ),
    );
  }
}
