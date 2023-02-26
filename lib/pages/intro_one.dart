// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import '../component/Button.dart';
import 'buttomNavigation.dart';
import 'home.dart';
import 'intro_two.dart';

class InOne extends StatefulWidget {
  const InOne({super.key});

  @override
  State<InOne> createState() => _InOneState();
}

class _InOneState extends State<InOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Image(
                    image: AssetImage('lib/assets/Focus.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              flex: 6,
            ),
            Expanded(
                // ignore: sort_child_properties_last
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Focus on the work \n that matters",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "jost",
                          fontWeight: FontWeight.w600,
                          fontSize: 30.sp,
                          color: Color.fromRGBO(33, 33, 33, 1)),
                    ),
                  ],
                ),
                flex: 2),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: RaisedButton(
                            title: 'Continue',
                            onTap: (){
                              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InTwo(),
                      ));
                            },
                          ),
                        ),
                        TextButton(
                            onPressed: (() {
                              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomTabBar(),
                      ));
                            }),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontFamily: "jost",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  color: Color.fromRGBO(33, 33, 33, 1)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}

