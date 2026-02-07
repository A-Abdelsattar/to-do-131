import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/widgets/custom_app_button.dart';
import 'package:todo_app/features/add_task/add_task_screen.dart';


class AddTaskRow extends StatelessWidget {
  final void Function()? onPressed;
  const AddTaskRow({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat.MMMEd().format(DateTime.now()).toString(),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),
            )
          ],
        )),
        SizedBox(
          width: 160.w
          ,child: CustomAppButton(title: "+ Add Task",
        onPressed: onPressed,
        ),
        )
      ],
    );
  }
}
