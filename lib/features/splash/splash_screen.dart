import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/app_contstants.dart';
import 'package:todo_app/features/auth/models/user_model.dart';
import 'package:todo_app/features/home/home_screen.dart';

import '../auth/auth_screen.dart' show AuthScreen;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      print("test${Hive.box<UserModel>(AppConstants.userBox).isEmpty}");
      if(Hive.box<UserModel>(AppConstants.userBox).isEmpty){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/splash_image.json"),
            Text("Taskati",style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),),
            Text("it's time to get organized",style: TextStyle(
              fontSize: 18.sp
            ),)
          ],
        ),
      ),
    );
  }
}
