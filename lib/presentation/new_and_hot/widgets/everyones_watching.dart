import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/home/widgets/custom_icon_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  DataModel everyData;
  EveryonesWatchingWidget({
    Key? key,
    required this.everyData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Text(
            everyData.title!,
            style:  TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            everyData.overview!,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          kHeight50,
          VideoWidget(
            image: "$kBaseUrl${everyData.posterPath}",
          ),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              CustomButtonWidget(
                icon: Icons.share,
                title: "Share",
                iconSize: 25.sp,
                fontSize: 16.sp,
              ),
              kWidth10,
              CustomButtonWidget(
                icon: Icons.add,
                title: "My List",
                iconSize: 25.sp,
                fontSize: 16.sp,
              ),
              kWidth10,
              CustomButtonWidget(
                icon: Icons.play_arrow,
                title: "Play",
                iconSize: 25.sp,
                fontSize: 16.sp,
              ),
              kWidth10
            ],
          )
        ],
      ),
    );
  }
}
