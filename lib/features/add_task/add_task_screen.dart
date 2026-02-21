import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/app_contstants.dart';
import 'package:todo_app/core/widgets/custom_app_button.dart';
import 'package:todo_app/core/widgets/custom_text_form_filed.dart';
import 'package:todo_app/features/home/models/task_model.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey=GlobalKey<FormState>();

  List<Color> taskColors=[
    Colors.indigo,
    Colors.green,
    Colors.purple,

  ];
  int activeIndex=0;

  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var dateController=TextEditingController();
  var startTimeController=TextEditingController();
  var endTimeController=TextEditingController();
  String? date;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.indigo
        ),
        title: Text("Add Task",style: TextStyle(
          fontSize: 20.sp,
          color: Colors.indigo
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.h,
            children: [
             Form(
               autovalidateMode:AutovalidateMode.onUserInteraction ,
              key: formKey
              ,child: Column(
               spacing: 20.h,
               children: [
                 CustomTextFormFiled(
                   controller: titleController,
                   hintText: "Task Title",
                   validator:(value){
                     if(value==null||value.isEmpty){
                       return "Task Title is Required";
                     }else if(value.length<4){
                       return "title must be at least 4 characters";
                     }
                   } ,
                 ),
                 CustomTextFormFiled(
                   controller: descriptionController,
                   hintText: "Enter Description",
                   maxLines: 4,
                   validator: (value){
                     if(value==null||value.isEmpty){
                       return "Task description is Required";
                     }
                   },
                 ),
                 CustomTextFormFiled(
                   controller: dateController,
                   hintText: "Enter Task Date",
                   suffixIcon: Icon(Icons.date_range),
                   validator: (value){
                     if(value==null||value.isEmpty){
                       return "Date is Required";
                     }
                   },
                   readOnly: true,
                   onTap: (){
                     showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2027),

                     ).then((d){
                       date=DateFormat.MMMEd().format(d??DateTime.now());
                       dateController.text=date.toString();
                     }).catchError((error){



                     });
                   },
                 ),

                 Row(
                   children: [
                     Expanded(child: CustomTextFormFiled(
                   controller: startTimeController
                   ,hintText: "start Time",
                       readOnly: true,
                       onTap: (){
                         showTimePicker(context: context, initialTime: TimeOfDay.now()).then((time){
                           startTime=time;
                           startTimeController.text=time?.format(context).toString()??"";
                         });
                       },
                       validator: (value){
                         if(value==null||value.isEmpty){
                           return "start time is Required";
                         }
                       },
                     )),
                     SizedBox(width: 10.w,),
                     Expanded(child: CustomTextFormFiled(
                     controller: endTimeController
                     ,hintText: "End Time",
                       readOnly: true,
                       onTap: (){
                         showTimePicker(context: context, initialTime: TimeOfDay.now()).then((time){
                           endTime=time;
                           endTimeController.text=time?.format(context)??"";
                         });
                       },
                       validator: (value){
                         if(value==null||value.isEmpty){
                           return "end time  is Required";
                         }else if(endTime!.isBefore(startTime!)){
                           return "end time must be after start time";
                         }
                       },
                     )),
                   ],
                 ),

               ],
             )),

              SizedBox(
                height: 50.h,
                child: ListView.separated(
                scrollDirection: Axis.horizontal
                ,itemBuilder: (context,index)=>InkWell(
                  onTap: (){
                    setState(() {
                      activeIndex=index;

                    });
                  },
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: taskColors[index],
                    child:activeIndex==index? Icon(Icons.check,color: Colors.white,):null,
                  ),
                ), separatorBuilder: (context,index)=>SizedBox(width: 10.h,), itemCount: taskColors.length),
              ),


              CustomAppButton(title: "Create Task",
              onPressed: (){

                if( formKey.currentState?.validate()??false){

                  Hive.box<TaskModel>(AppConstants.taskBox).add(TaskModel(title: titleController.text,
                      startTime: startTimeController.text??"", endTime: endTimeController.text??"",
                      description: descriptionController.text,
                      statusText: "ToDo", color: taskColors[activeIndex].toARGB32()));

                  allTasks.add(TaskModel(title: titleController.text,
                      startTime: startTimeController.text??"", endTime: endTimeController.text??"",
                      description: descriptionController.text,
                      statusText: "ToDo", color: taskColors[activeIndex].toARGB32()));
                  Navigator.pop(context);
                }

              },
              )
            ],
          ),
        ),
      ),
    );
  }
}
