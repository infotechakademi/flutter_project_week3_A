import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'house_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_bullet),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
            ),
          ],
        ),
        tabBuilder: (context, int index) {
          switch (index) {
            case 0:
              return mainPage();
            case 1:
              return Center(
                child: CupertinoActivityIndicator(
                  radius: 18,
                ),
              );
            case 2:
              return houseListPage();
            default:
              return SizedBox();
          }
        });
  }

  Widget mainPage() {
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text("Emlakçım"),
        ),
      ],
    ));
  }

  Widget houseListPage() {
    return CupertinoPageScaffold(
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int _) {
            return Divider(
              height: 8,
            );
          },
          itemCount: 15,
          itemBuilder: (context, index) {
            return Material(
              child: ListTile(
                title: Text("$index. Ev"),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HouseDetails(),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
