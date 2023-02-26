// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_stack/image_stack.dart';
import 'package:sizer/sizer.dart';

class CardHome extends StatefulWidget {

  final Image imageOne;
  final Image imageTwo;
  final String taskName;
  final String hashName;
  final String timing;
  final String typeOfProject;

  const CardHome({super.key, required this.imageOne, required this.imageTwo, required this.taskName, required this.hashName, required this.timing, required this.typeOfProject});

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  late String imageOne;
  late String imageTwo;
  late String taskName;
  late String hashName;
  late String timing;
  late String typeOfProject;

  @override
  Widget build(BuildContext context) {
    List<String> images = <String>[
      imageOne,
      imageTwo,
    ];

    List<Widget> widgets = [
      ...images.map<Widget>((img) => Image.network(
            img,
            fit: BoxFit.cover,
          ))
    ];

    List<ImageProvider> providers = [
      ...images.map<ImageProvider>((img) => NetworkImage(
            img,
          ))
    ];

    return Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(251, 243, 152, 1),
                    borderRadius: BorderRadius.circular(30)
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            taskName,
                            style: TextStyle(
                                color: Color.fromRGBO(33, 33, 33, 1),
                                fontFamily: "jost",
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
                                typeOfProject,
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
                          Text(hashName,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromRGBO(114, 114, 114, 1)))
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 2.h,
                                child: Image(
                                    image: AssetImage('lib/assets/Time.png')),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                timing,
                                style: TextStyle(
                                    color: Color.fromRGBO(33, 33, 33, 1),
                                    fontFamily: "Montserrat",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          ImageStack(
                            imageList: images,
                            imageRadius: 43,
                            imageCount: 2,
                            imageBorderWidth: 2,
                            totalCount: 2,
                            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                            imageBorderColor: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }
}
