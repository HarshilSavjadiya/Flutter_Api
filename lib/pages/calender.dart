import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  int selected = 0;

  Widget _tile(bool f, bool l, String taskName, String time, String subTitle,
      String timeLineTime, Color color) {
    return TimelineTile(
      indicatorStyle: IndicatorStyle(
        height: 3.h,
        width: 3.w,
        color: Color.fromRGBO(33, 33, 33, 1),
      ),
      isFirst: f,
      isLast: l,
      beforeLineStyle: LineStyle(color: Color.fromRGBO(33, 33, 33, 1)),
      axis: TimelineAxis.vertical,
      alignment: TimelineAlign.manual,
      lineXY: 0.2,
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      taskName,
                      style: TextStyle(
                          color: Color.fromRGBO(33, 33, 33, 1),
                          fontFamily: "Montserrat",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 1.5.h,
                          child:
                              Image(image: AssetImage('lib/assets/Time.png')),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              color: Color.fromRGBO(33, 33, 33, 1),
                              fontFamily: "Montserrat",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Text(subTitle,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(114, 114, 114, 1)))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      startChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(timeLineTime),
        ],
      ),
    );
  }

  Widget calBox(String nudate, String nuday, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          nuday,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(151, 151, 151, 1),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        InkWell(
          highlightColor: Colors.black.withOpacity(0.0),
          splashColor: Colors.black.withOpacity(0.0),
          onTap: (() {
            setState(() {
              selected = index;
            });
          }),
          child: Container(
            decoration: BoxDecoration(
              color: (selected == index)
                  ? Color.fromRGBO(33, 33, 33, 1)
                  : Color.fromRGBO(243, 245, 247, 1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  Text(
                    nudate,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: (selected == index)
                            ? Color.fromRGBO(243, 245, 247, 1)
                            : Color.fromRGBO(33, 33, 33, 1)),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(243, 245, 247, 1)),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(243, 245, 247, 1)),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(243, 245, 247, 1)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 245, 247, 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                "Calendar",
                                style: TextStyle(
                                    fontFamily: "Jost",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 33.sp,
                                    color: Color.fromRGBO(33, 33, 33, 1)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            calBox("16", "S", 1),
                            calBox("17", "M", 2),
                            calBox("18", "T", 3),
                            calBox("19", "W", 4),
                            calBox("20", "T", 5),
                            calBox("21", "F", 6),
                            calBox("22", "S", 7)
                          ],
                        )
                      ],
                    ),
                  )),
              flex: 3,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      _tile(true, false, "Standup", "30 min", "Every day metting",
                          "11:00am", Color.fromRGBO(221, 223, 254, 1)),
                      _tile(false, false, "UI design", "3 hrs", "Fintech app",
                          "12:00am", Color.fromRGBO(251, 243, 152, 1)),
                      _tile(false, false, "Kickoff", "1 hrs", "Travel app",
                          "12:00am", Color.fromRGBO(201, 253, 199, 1)),
                      _tile(false, false, "Logo design", "4 hrs", "Fintech app",
                          "1:00am", Color.fromRGBO(221, 223, 254, 1)),
                      _tile(false, true, "Ux design", "4 hrs", "Healthy app",
                          "5:15pm", Color.fromRGBO(251, 243, 152, 1))
                    ],
                  ),
                ),
              ),
              flex: 7,
            )
          ],
        ),
      ),
    );
  }
}