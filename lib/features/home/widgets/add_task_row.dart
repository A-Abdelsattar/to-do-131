import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/widgets/custom_app_button.dart';


class AddTaskRow extends StatelessWidget {
  const AddTaskRow({super.key});

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
          width: 150.w
          ,child: CustomAppButton(title: "+ Add Task",
        onPressed: (){},
        ),
        )
      ],
    );
  }
}
