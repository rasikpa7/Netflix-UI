import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/downloads/models/all_data_model.dart/all_data_model.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatefulWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
  final _widgetList = [
    const _SmartDownloads(),
    _Section2(),
    const _Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppbarWidget(appBarTitle: "Downloads"),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (ctx, index) => _widgetList[index],
        separatorBuilder: (ctx, index) => SizedBox(
          height: 20.h,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}

//########...Section 2...########

class _Section2 extends StatefulWidget {
  _Section2({Key? key}) : super(key: key);

  @override
  State<_Section2> createState() => _Section2State();
}

class _Section2State extends State<_Section2> {
  final List<DataModel> dataList = [];

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {

    // });
    print(dataList);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introdusing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
         Text(
          textAlign: TextAlign.center,
          "We'll doawnload a personalized selection of\nmovies and shows for you, so there's always\nsomething to watch on your device.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
          ),
        ),
        kHeight,
        SizedBox(
          height:
           size.width,
          width: size.width,
          child: FutureBuilder(
              future: MovieDB().getAllMovies(),
              builder: (BuildContext context, AsyncSnapshot dataListData) {
                if (dataListData.data == null) {
                  return Center(
                    child: SizedBox(
                      height: 50.h,
                      width: 50.w,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.37,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                      DownloadsImgaeWidget(
                        imagePath:
                            '$kBaseUrl${dataListData.data[0].posterPath}',
                        height: 0.5.h,
                        margin: EdgeInsets.only(
                          left: 150.w,
                          bottom: 20.h,
                        ),
                        angle: 20.r,
                      ),
                      DownloadsImgaeWidget(
                        imagePath:
                            '$kBaseUrl${dataListData.data[1].posterPath}',
                        height: 0.5.h,
                        margin: EdgeInsets.only(
                          right: 150.w,
                          bottom: 20.h,
                        ),
                        angle: -20,
                      ),
                      DownloadsImgaeWidget(
                        height: 0.58,
                        imagePath:
                            '$kBaseUrl${dataListData.data[2].posterPath}',
                        margin: EdgeInsets.only(top: 15.h),
                      )
                    ],
                  );
                }
              }),
        ),
      ],
    );
  }
}

//########...Section 3...########

class _Section3 extends StatelessWidget {
  const _Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width:
           size.width * .85,
          child: MaterialButton(
            onPressed: () {},
            color: kBtnColorBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child:  Padding(
              padding: EdgeInsets.symmetric(vertical: 11.h),
              child: Text(
                "Set Up",
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                  color: kBtnColorWhite,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          onPressed: () {},
          color: kBtnColorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5).r,
          ),
          child:  Padding(
            padding: EdgeInsets.symmetric(vertical: 11.h),
            child: Text(
              "See What You Can Download",
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        Text(
          "Smart Downloads",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class DownloadsImgaeWidget extends StatefulWidget {
  DownloadsImgaeWidget({
    Key? key,
    required this.imagePath,
    this.angle = 0,
    required this.margin,
    required this.height,
  }) : super(key: key);

  final String imagePath;
  final double angle;
  final EdgeInsets margin;
  final double height;

  @override
  State<DownloadsImgaeWidget> createState() => _DownloadsImgaeWidgetState();
}

class _DownloadsImgaeWidgetState extends State<DownloadsImgaeWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: widget.angle * pi / 180,
      child: Container(
        margin: widget.margin,
        width: size.width * 0.387,
        height: size.width * widget.height,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                widget.imagePath,
              ),
            ),
            color: kBlackColor,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
