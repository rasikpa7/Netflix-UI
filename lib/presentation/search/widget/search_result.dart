import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/apis.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:netflix/presentation/search/widget/search_input_field.dart';
import 'package:netflix/presentation/search/widget/title.dart';

class SearchResultWidget extends StatelessWidget {
  String querry;
   SearchResultWidget({
    Key? key,
    required this.querry,
  }) : super(key: key);

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
                  child: FutureBuilder(
                      future: MovieDB().search(querry),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<DataModel>> searchResult) 
                          {
                        if (searchResult.data == null) {
                          return Center(
                            child: SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: const CircularProgressIndicator(),
                            ),
                          );
                        } else if (searchResult.data!.isEmpty) {
                          return Text(
                            "No match found",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                            ),
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SearchTextTitle(
                                title: querry,
                              ),
                              kHeight,
                              Expanded(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 1.2 / 1.7,
                                  children: List.generate(20, (index) {
                                    return MainCard(
                                        resultData: searchResult.data![index]);
                                  }),
                                ),
                              ),
                            ],
                          );
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  DataModel resultData;
  MainCard({Key? key, required this.resultData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('$kBaseUrl${resultData.posterPath}'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
