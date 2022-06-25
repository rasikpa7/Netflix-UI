import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import '../../core/strings.dart';
import '../downloads/models/data_model/data_model.dart';
import 'main_card.dart';

class ContinueWatchingScreen extends StatelessWidget {
  String mainTitle;
  ContinueWatchingScreen({Key? key, required this.mainTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: mainTitle,
        ),
        LimitedBox(
          maxHeight: 200.h,
          child: FutureBuilder(
              future: MovieDB().getAllMovies(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<DataModel>> snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Container(
                        width: 50.w,
                        height: 50.h,
                        child: const CircularProgressIndicator()),
                  );
                }
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(snapshot.data!.length, (index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 150.w,
                          height: 225.h,
                          decoration: BoxDecoration(
                            borderRadius: kRadius10,
                            image: DecorationImage(
                              image: NetworkImage(
                                '$kBaseUrl${snapshot.data![index].posterPath}',
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                     BorderRadius.all(Radius.circular(50.0.r)),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child:  CircleAvatar(
                                backgroundColor: Colors.black38,
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  size: 50.sp,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          top: 150.h,
                          child: Container(
                            width: 134.w,
                            height: 50.h,
                            color: const Color.fromARGB(255, 58, 57, 57),
                            child: Column(
                              children: [
                                const LinearProgressIndicator(
                                  value: 0.5,
                                  color: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                );
              }),
        ),
      ],
    );
  }
}
