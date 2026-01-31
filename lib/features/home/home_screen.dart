

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/app_contstants.dart';
import 'package:todo_app/features/auth/auth_screen.dart';
import 'package:todo_app/features/auth/models/user_model.dart';
import 'package:todo_app/features/home/models/task_model.dart';
import 'package:todo_app/features/home/widgets/add_task_row.dart';
import 'package:todo_app/features/home/widgets/home_app_bar.dart';
import 'package:todo_app/features/home/widgets/task_item.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userData=Hive.box<UserModel>(AppConstants.userBox).getAt(0);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(children: [
            if(userData!=null)
            HomeAppBar(userData: userData),
            SizedBox(height: 20.h,),
            AddTaskRow(),
            SizedBox(height: 20.h,),
            Expanded(
              child: ListView.separated(itemBuilder: (context,index){
                return Dismissible(
                  background: Icon(Icons.delete),
                  secondaryBackground: Icon(Icons.add_a_photo),
                key: UniqueKey(),
                child: TaskItem(
                  task: allTasks[index],
                ));
              }, separatorBuilder: (context,index)=>SizedBox(height: 10.h,), itemCount: allTasks.length),
            )
          ],),
        ),
      ),
    );
  }
}
