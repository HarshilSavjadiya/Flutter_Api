// ignore_for_file: sort_child_properties_last, unnecessary_import, implementation_imports, prefer_const_constructors, unused_element

import 'dart:convert';
import 'dart:math';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_stack/image_stack.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../component/card_home.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;

  var listResponse;
  var mapResponse;

  List gbycolors = [
    Color.fromRGBO(201, 253, 199, 1),
    Color.fromRGBO(221, 223, 254, 1),
    Color.fromRGBO(251, 243, 152, 1)
  ];

  List types = ["Medium", "Asap", "Low"];

  Widget boxChip(String chipTitle, int index) {
    return InkWell(
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
                : Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                color: Color.fromRGBO(33, 33, 33, 1), width: 1.5.sp)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
          child: Text(
            chipTitle,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: (selected == index)
                    ? Color.fromRGBO(255, 255, 255, 1)
                    : Color.fromRGBO(33, 33, 33, 1)),
          ),
        ),
      ),
    );
  }

  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://631912b58e51a64d2bde2f2b.mockapi.io/Match"));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          child: TitleBar(),
          flex: 1,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              boxChip("To do", 1),
              boxChip("In progress", 2),
              boxChip("Done", 3),
            ],
          ),
          flex: 2,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: gbycolors[Random().nextInt(gbycolors.length)],
                          borderRadius: BorderRadius.circular(035)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  listResponse[index]['TaskName'].toString(),
                                  style: TextStyle(
                                      color: Color.fromRGBO(33, 33, 33, 1),
                                      fontFamily: "Jost",
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: Color.fromRGBO(33, 33, 33, 1),
                                          width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    child: Text(
                                      types[Random().nextInt(types.length)],
                                      style: TextStyle(
                                          color: Color.fromRGBO(33, 33, 33, 1),
                                          fontFamily: "Montserrat",
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("#",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        color:
                                            Color.fromRGBO(114, 114, 114, 1))),
                                Text(listResponse[index]['HasName'].toString(),
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        color:
                                            Color.fromRGBO(114, 114, 114, 1)))
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 2.h,
                                      child: Image(
                                          image: AssetImage(
                                              'lib/assets/Time.png')),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          DateFormat('dd')
                                              .format(DateTime.now()),
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(33, 33, 33, 1),
                                              fontFamily: "Montserrat",
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          listResponse[index]['month']
                                              .toString(),
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(33, 33, 33, 1),
                                              fontFamily: "Montserrat",
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: 10.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 5),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            listResponse[index]['ImageOne']),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
            itemCount: listResponse == null ? 0 : listResponse.length,
          ),
          flex: 8,
        )
      ],
    )));
  }

  Row TitleBar() {
    return Row(
      children: [
        SizedBox(
          width: 3.w,
        ),
        Text(
          "Projects",
          style: TextStyle(
              fontFamily: "jost",
              fontWeight: FontWeight.w600,
              fontSize: 33.sp,
              color: Color.fromRGBO(33, 33, 33, 1)),
        ),
        SizedBox(
          width: 3.w,
        ),
        BorderedText(
          strokeWidth: 3.0.sp,
          strokeColor: Color.fromRGBO(33, 33, 33, 1),
          child: Text(
            'Goals',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 31.0.sp,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontFamily: 'jost',
            ),
          ),
        )
      ],
    );
  }
}
