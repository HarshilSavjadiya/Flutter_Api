import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class Hipo extends StatefulWidget {
  const Hipo({super.key});

  @override
  State<Hipo> createState() => _HipoState();
}

class _HipoState extends State<Hipo> {

    int selected = 0;

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
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12 ),
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
                          color: Color.fromRGBO(243, 245, 247, 1)
                        ),
                      ),
                      SizedBox(
                    width: 1.w,
                  ),
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(243, 245, 247, 1)
                        ),
                      ),
                      SizedBox(
                    width: 1.w,
                  ),
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(243, 245, 247, 1)
                        ),
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
                        PageView(
                          scrollDirection: Axis.horizontal,
                          children: [
                              Container(
                              child: Column(),
                              )
                              ],
                          ),
                          ],
                          )
                    ),
        )));
  }}