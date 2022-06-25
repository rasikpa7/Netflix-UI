import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/infrastructure/apis.dart';

import '../models/category/genre.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            FutureBuilder(
                future: MovieDB().categories(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Genre>> categoryList) {
                  if (categoryList.data == null) {
                    return  Center(
                      child: SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: const CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return ListView.separated(
                      physics:  const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>  SizedBox(
                        height: 25.h,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Genre category = categoryList.data![index];
                        return Column(
                          children: [
                            SizedBox(height: index == 0 ? 100.h : 0.h),
                            Text(
                              category.name ?? "Loading",
                              style:  TextStyle(
                                  color: Colors.white, fontSize: 25.sp),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              color: Colors.transparent,
                              height: index == categoryList.data!.length - 1
                                  ? 200.h
                                  : 0.h,
                            )
                          ],
                        );
                      },
                      itemCount: categoryList.data!.length,
                    );
                  }
                }),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                radius: 25.r,
                child: Icon(
                  Icons.close,
                  size: 29.sp,
                  color: Colors.black.withOpacity(0.1),
                ),
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

