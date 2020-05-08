import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magulab_flutter/pages/home/request.dart';

import 'response.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          backgroundColor: Colors.black,
          inactiveColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              title: Text('받은 요청'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book),
              title: Text('요청 조건'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              title: Text('예약'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              title: Text('내 정보'),
            ),
          ]),
      tabBuilder: (context, index) {
        if (index == 0) {
          return ResponsePage();
        } else if (index == 1) {
          return RequestPage();
        } else if (index == 2) {
          return ResponsePage();
        } else {
          return ResponsePage();
        }
      },
    );
  }
}
