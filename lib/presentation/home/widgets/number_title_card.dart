import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/home/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final callFrom;
  const NumberTitleCard({
    Key? key,
    this.callFrom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: "Top 10 in India Today",
        ),
        LimitedBox(
          maxHeight: 200.h,
          child: FutureBuilder(
              future: MovieDB().getPopular(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<DataModel>> dataList) {
                if (dataList.data == null) {
                  return   Center(
                      child: SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: const CircularProgressIndicator()));
                } else {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        10,
                        (index) => NumberCard(
                              index: index,
                              path: dataList.data![index].posterPath,
                            )),
                  );
                }
              }),
        ),
      ],
    );
  }
}
