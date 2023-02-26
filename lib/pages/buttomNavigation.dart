import 'package:flutter/material.dart';
import 'package:promanager/pages/home.dart';
import 'package:sizer/sizer.dart';

import '../component/NavItem.dart';
import 'calender.dart';
import 'create.dart';
import 'messege.dart';

class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {

  late var screens = [Home(), Calender(), Messege() ,CreateTask()];
  
  var selectedIndex = 0;

  void getIndex(i){
    setState(() {
        selectedIndex = i;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[selectedIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
        child: Material(
          elevation: 0,
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(33, 33, 33, 1),
          child: Container(
            height: 10.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navItem(
                  a: 'lib/assets/Home.png',
                  onTap: (() {
                    getIndex(0);
                  }),
                  h: 2,
                ),
                navItem(
                  a: 'lib/assets/Calender.png',
                  onTap: () {
                    getIndex(1);
                  },
                  h: 2,
                ),
                navItem(
                  a: 'lib/assets/Messege.png',
                  onTap: () {
                    getIndex(2);
                  },
                  h: 2,
                ),
                navItem(
                  a: 'lib/assets/Add.png',
                  onTap: () {
                    getIndex(3);
                  },
                  h: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
