import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final String? path;
  const NumberCard({
    Key? key,
    required this.path,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: [
           SizedBox(
            width: 30.w,
            height: 150.h,
          ),
          Container(
            width: 150.w,
            height: 225.h,
            decoration: BoxDecoration(
              borderRadius: kRadius10.r,
              image: DecorationImage(
                image: NetworkImage(
                  "$kBaseUrl$path",
                ),
              ),
            ),
          ),
        ],
      ),
      Positioned(
        top: 65.h,
        child: BorderedText(
          strokeColor: const Color.fromARGB(255, 197, 197, 197),
          strokeWidth: 5.0,
          child: Text("${index + 1}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 140.sp,
                decoration: TextDecoration.none,
              )),
        ),
      )
    ]);
  }
}
