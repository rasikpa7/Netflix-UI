import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/widget/search_result.dart';

class SearchInputWidget extends StatelessWidget {
  SearchInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      onSubmitted: (value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultWidget(querry: value), 
          ),
        );
      },
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: Colors.grey,
      ),
      suffixIcon: const Icon(
        CupertinoIcons.xmark_circle_fill,
        color: Colors.grey,
      ),
      style: const TextStyle(color: Colors.white),
      backgroundColor: Colors.grey.withOpacity(0.4),
    );
  }
}
