import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/widgets/custom_app_button.dart';



class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[

          CustomAppButton(title: "title",
              onPressed: (){
            showModalBottomSheet(context: context, builder: (context){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 20.h,
                  children: [
                    CustomAppButton(title: "title",
                    onPressed: (){},
                    ),
                    CustomAppButton(title: "title",onPressed: (){},),
                  ],
                ),
              );
            });
              },
          )

        ]
      )
    );
  }
}
