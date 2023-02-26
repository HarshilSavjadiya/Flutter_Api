import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class RaisedButton extends StatelessWidget {

  final String title;
  final Function() onTap;

  const RaisedButton({required this.title, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color.fromRGBO(33, 33, 33, 1),
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 25),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: "jost",
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: Color.fromRGBO(
                              255, 255, 255, 1)),
                    ),
                    Image(
                      image: AssetImage(
                          'lib/assets/Forward.png'),
                      height: 15.sp,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}