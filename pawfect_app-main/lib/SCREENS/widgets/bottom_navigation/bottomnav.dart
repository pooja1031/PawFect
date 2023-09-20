import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return Container(
          height: 80,
          
          child: BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromARGB(
              255,
              28,
              163,
              41,
            ),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            unselectedIconTheme: const IconThemeData(
              color: Colors.grey,
            ),
            iconSize: 49,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_sharp,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.forum),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.groups,
                ),
                label: "Community",
              ),
            ],
          ),
        );
      },
    );
  }
}
