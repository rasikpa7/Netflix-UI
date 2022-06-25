import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/home/widgets/custom_icon_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class CommingSoonWidget extends StatelessWidget {
  DataModel commingSoon;
  CommingSoonWidget({
    Key? key,
    required this.commingSoon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50.w,
          height: 425.h,
          child: Column(
            children:  [
              Text(
                "FEB",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50.w,
          height: 425.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                  image: '$kBaseUrl${commingSoon.posterPath}'), //for image
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // const Spacer(),
                  Wrap(
                    children:  [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: "Remind Me",
                        iconSize: 20.sp,
                        fontSize: 12.sp,
                      ),
                      kWidth20,
                      kWidth20,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: "Info",
                        iconSize: 20.sp,
                        fontSize: 12.sp,
                      ),
                      kWidth20,
                      kWidth20,
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      commingSoon.title!,
                      style:  TextStyle(
                        letterSpacing: -2,
                        fontSize: 29.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ),
                ],
              ),
              kHeight,
              const Text("Comming on Friday"),
              kHeight,

              Text(
                commingSoon.originalTitle!,
                style:  TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              
              RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: commingSoon.overview!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  )),
              kHeight,
              Row(
                children: [],
              )
            ],
          ),
        ),
      ],
    );
  }
}
