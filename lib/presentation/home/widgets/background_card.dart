import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/home/widgets/custom_icon_widget.dart';

class BackgroundCard extends StatelessWidget {
  BackgroundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
            future: MovieDB().getTrending(),
            builder: (BuildContext context,
                AsyncSnapshot<List<DataModel>> dataList) {
              if (dataList.data == null) {
                return  SizedBox(
                    width: double.infinity,
                    height: 565.h,
                    child: Center(
                      child: SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: const CircularProgressIndicator(),
                      ),
                    ));
              } else {
                return Container(
                  width: double.infinity,
                  height: 565.h,
                  decoration:const BoxDecoration(
                  
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/iwnQ1JH1wdWrGYkgWySptJ5284A.jpg'),
                    ),
                  ),
                );
              }
            }),
        Positioned(
          bottom: 0.h,
          left: 0.w,
          right: 0.w,
          child: Padding(
            padding:  EdgeInsets.only(bottom: 10.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: "My List",
                ),
                _playButton(),
                const CustomButtonWidget(
                  icon: Icons.info,
                  title: "Info",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kWhiteColor),
    ),
    onPressed: () {},
    icon:  Icon(
      Icons.play_arrow,
      size: 30.sp,
      color: kBlackColor,
    ),
    label:  Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Text(
        "Play",
        style: TextStyle(
          fontSize: 25.sp,
          color: kBlackColor,
        ),
      ),
    ),
  );
}
