import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pawfect/SCREENS/widgets/bottom_navigation/bottomnav.dart';
import 'package:pawfect/SCREENS/chat/chat.dart';
import 'package:pawfect/SCREENS/community/community.dart';

import '../home/home.dart';

class ScreenMainPage extends StatefulWidget {
  const ScreenMainPage({super.key});

  @override
  State<ScreenMainPage> createState() => _ScreenMainPageState();
}

class _ScreenMainPageState extends State<ScreenMainPage> {
  final _pages = [
    ScreenHome(),
    ScreenChatBot(),
    ScreenCommunity(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
