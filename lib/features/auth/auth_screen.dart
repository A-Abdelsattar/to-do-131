import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/widgets/custom_app_button.dart';
import 'package:todo_app/core/widgets/custom_text_form_filed.dart';
import 'package:todo_app/features/auth/models/user_model.dart';
import 'package:todo_app/features/home/home_screen.dart';

import '../../core/app_contstants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {


  final ImagePicker picker = ImagePicker();
  XFile? image;
  TextEditingController nameController=TextEditingController();
  void openCamera()async{
   image= await picker.pickImage(source: ImageSource.camera);
   setState(() {

   });
  }
 void openGallery()async{
  image= await picker.pickImage(source: ImageSource.gallery);
  setState(() {

  });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        padding:EdgeInsets.only(left: 16.0.w,right: 16.w,top: 100.h) ,
        child: Column(
          spacing: 20.h,
             children: [

               Visibility(
          visible: image==null
          ,child: CircleAvatar(
                 radius: 100.r,
                 child: Icon(Icons.person,size: 100.r,),
               ),
               replacement:Container(
                 width: 200.w,
                 height: 200.h,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   image: DecorationImage(
                     fit: BoxFit.contain,
                       image: Image.file(File(image?.path??"")).image,
                   )
                 ),
               ) ,
               ),


            CustomAppButton(
              title: "Upload from Camera",
              onPressed: (){
                openCamera();
              },
            )
            ,
            CustomAppButton(
              title: "Upload from Gallery",
              onPressed: (){
                openGallery();
              },
            ),
            Divider(
              color: Colors.indigo,
            ),
            CustomTextFormFiled(
              controller: nameController,
              hintText: "Enter Your Name",
            ),

               CustomAppButton(
                 title: "Login",
                 onPressed: (){
                   if(image==null){
                     // showDialog(context: context, builder: (context)=>AlertDialog(
                     //   title: Text("Error"),
                     //   content: Text("Image is Required"),
                     //   actions: [
                     //     TextButton(onPressed: (){
                     //       Navigator.pop(context);
                     //     }, child: Text("Ok"))
                     //   ],
                     // ));
                     ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("Image is required"),backgroundColor: Colors.red,));
                     return;
                   }
                   
                   Hive.box<UserModel>(AppConstants.userBox).add(UserModel(image: image?.path??"",
                       name: nameController.text)).then((v){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                   }).catchError((e){
                     print("error$e");

                   });
                 },
               ),


          ],
        ),
      ) ,
    );
  }
}
