import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class AppbarWidget extends StatelessWidget {
  String appBarTitle;
  AppbarWidget({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            appBarTitle,
            style: GoogleFonts.montserrat(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
         const 
          Icon(
            Icons.cast,
            color: kWhiteColor,
          ),
          kWidth10,
          Container(
            height: 35.h,
            width: 30.w,
            color: Colors.blue,
            child: Image.network('https://ih0.redbubble.net/image.618427277.3222/flat,1000x1000,075,f.u2.jpg',fit: BoxFit.cover,)
          ),
          kWidth10,
        ],
      ),
    );
  }
}
