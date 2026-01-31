import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/app_contstants.dart';
import 'package:todo_app/features/auth/models/user_model.dart';
import 'package:todo_app/todo_app.dart';

void main()async{
  await Hive.initFlutter();//3
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(AppConstants.userBox);
  runApp(TodoApp());
}