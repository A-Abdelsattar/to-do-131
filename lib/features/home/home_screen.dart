

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/app_contstants.dart';
import 'package:todo_app/features/auth/auth_screen.dart';
import 'package:todo_app/features/auth/models/user_model.dart';
import 'package:todo_app/features/home/widgets/add_task_row.dart';
import 'package:todo_app/features/home/widgets/home_app_bar.dart';
import 'package:todo_app/features/home/widgets/tasks_list_view.dart';

import '../add_task/add_task_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            AddTaskRow(
              onPressed: ()async{
                await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
                setState(() {

                });
              },
            ),
            SizedBox(height: 20.h,),
            TasksListView()
          ],),
        ),
      ),
    );
  }
}
