import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';

class MainCardWidget extends StatelessWidget {
  final url;
  const MainCardWidget({
    Key? key,
    
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 225.h,
      decoration: BoxDecoration(
        borderRadius: kRadius10.r,
        image: DecorationImage(
          image: NetworkImage(
            '$kBaseUrl$url',
          ),
        ),
      ),
    );
  }
}
