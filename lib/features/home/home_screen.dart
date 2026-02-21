

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
import 'package:todo_app/features/home/widgets/tasks_list_view.dart';

import '../add_task/add_task_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int activeIndex=0;
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
            Row(
              children: [
                Expanded(child: FilterButton(title: 'All', isActive: activeIndex==0,
                onTap: (){
                  setState(() {
                    allTasks=Hive.box<TaskModel>(AppConstants.taskBox).values.toList();
                    activeIndex=0;
                  });
                },

                )),
                SizedBox(width: 10.w,),
                Expanded(child: FilterButton(title: 'ToDo',
                isActive: activeIndex==1,
                  onTap: (){
                  setState(() {
                    allTasks=Hive.box<TaskModel>(AppConstants.taskBox).values.toList().where((e)=>e.statusText.toLowerCase()=="todo").toList();
                    activeIndex=1;
                  });
                  },
                )),
                SizedBox(width: 10.w,),
                Expanded(child: FilterButton(title: 'Completed',
                isActive: activeIndex==2,
                  onTap: (){
                  setState(() {
                    allTasks=Hive.box<TaskModel>(AppConstants.taskBox).values.toList().where((e)=>e.statusText.toLowerCase()=="completed").toList();
                    activeIndex=2;
                  });
                  },
                )),

              ],
            ),
            SizedBox(height: 20.h,),
            TasksListView()
          ],),
        ),
      ),
    );
  }
}



class FilterButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final void Function()? onTap;
  const FilterButton({super.key, required this.title,  this.isActive=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple),
          borderRadius: BorderRadius.circular(12.r),
          color:isActive? Colors.purple:Colors.transparent
        ),
        child: Center(child: Text(title,
        style: TextStyle(
          fontSize: 16.sp,
          color: isActive?Colors.white:Colors.black
        ),
        )),
      ),
    );
  }
}
