import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class navItem extends StatelessWidget {
  final String a;
  final Function() onTap;
  final int h;

  const navItem({
    required this.a,
    required this.h,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.black.withOpacity(0.0),
      splashColor: Colors.black.withOpacity(0.0),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: h.h,
          child: Image(image: AssetImage(a)),
        ),
      ),
    );
  }
}
