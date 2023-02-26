import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => CreateTaskState();
}

class CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(201, 253, 199, 1),
            borderRadius: BorderRadius.circular(50)
          ),
          height: 40.h,
          width: 80.w,
          
          child: Center(
            child: Text("404 Error",
              style: TextStyle(
                                    fontFamily: "Jost",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: Color.fromRGBO(123, 123, 123, 1)),
            ),
          )
        ),
      ),
    );
  }
}