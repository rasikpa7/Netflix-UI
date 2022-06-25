import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/search/widget/search_input_field.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const imageUrl = 'assets/images/img4.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInputWidget(),
              kHeight20,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchTextTitle(
                    title: "Top Searches",
                  ),
                  kHeight,
                  FutureBuilder(
                      future: MovieDB().getPopular(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<DataModel>> searchIdle) {
                        if (searchIdle.data == null) {
                          return  Center(
                            child: SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: const CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (ctx, index) => TopSearchItemTile(
                                  idleData: searchIdle.data![index]),
                              separatorBuilder: (ctx, index) => kHeight,
                              itemCount: searchIdle.data!.length,
                            ),
                          );
                        }
                      })
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  DataModel idleData;
  TopSearchItemTile({Key? key, required this.idleData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(children: [
      Container(
        width: screenWidth * 0.35,
        height: 80.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("$kBaseUrl${idleData.posterPath}"),
          ),
        ),
      ),
      kWidth10,
      Expanded(
        child: Text(
          idleData.title!,
          style:  TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
       CircleAvatar(
        backgroundColor: kWhiteColor,
        radius: 20.r,
        child: Padding(
          padding: EdgeInsets.only(left:1.0.w),
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 18.r,
            child: const Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
