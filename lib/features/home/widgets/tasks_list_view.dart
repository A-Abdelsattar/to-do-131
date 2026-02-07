import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/features/home/widgets/task_item.dart';

import '../models/task_model.dart';


class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return allTasks.isEmpty? Column(
      children: [
        SizedBox(height: 100.h,),
        Lottie.asset("assets/empty_tasks.json"),
      ],
    ):Expanded(
      child: ListView.separated(itemBuilder: (context,index){
        return Dismissible(
            background: Icon(Icons.delete),
            secondaryBackground: Icon(Icons.add_a_photo),
            key: UniqueKey(),
            child: TaskItem(
              task: allTasks[index],
            ));
      }, separatorBuilder: (context,index)=>SizedBox(height: 10.h,), itemCount: allTasks.length),
    );
  }
}
