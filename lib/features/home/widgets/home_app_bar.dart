import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/auth/models/user_model.dart';



class HomeAppBar extends StatelessWidget {
  final UserModel userData;
  const HomeAppBar({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Row(
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

      ],
    );
  }
}
