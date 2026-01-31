

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/app_contstants.dart';
import 'package:todo_app/features/auth/auth_screen.dart';
import 'package:todo_app/features/auth/models/user_model.dart';


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
            Row(
              children: [
                Expanded(child: Column(

            crossAxisAlignment: CrossAxisAlignment.start
            ,children: [
                  Text(userData?.name??"",style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("Have a nice day",style: TextStyle(
                    fontSize: 20.sp,
                  ),)
                ],)),

                CircleAvatar(
                  radius: 40.r,
                  backgroundImage:Image.file(File(userData?.image??"")).image ,
                ),

                Text("test"),
              ],
            )
          ],),
        ),
      ),
    );
  }
}
