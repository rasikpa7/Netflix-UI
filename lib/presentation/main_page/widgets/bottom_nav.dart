import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            currentIndex: indexChangeNotifier.value,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.collections,
                ),
                label: "New & Hot",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.emoji_emotions_outlined,
                ),
                label: "Fast Laughs",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_circle_down,
                ),
                label: "Downloads",
              ),
            ],
          );
        });
  }
}
