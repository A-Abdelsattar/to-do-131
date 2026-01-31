


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomAppButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(
            backgroundColor:Colors.indigo,
            minimumSize: Size(double.infinity, 60.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)
            )
        )
        ,onPressed: onPressed, child: Text(title,

      style: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),));
  }
}
