import 'package:flutter/material.dart';

import 'package:instagram2/pages/create_post.dart';
import 'package:instagram2/pages/home.dart';
import 'package:instagram2/pages/notifications.dart';
import 'package:instagram2/pages/profile.dart';
import 'package:instagram2/pages/search.dart';
import 'package:instagram2/provider/page.dart';
import 'package:provider/provider.dart';

class InstagramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostPage(),
        )
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    // 탭바 컨텐츠
    HomePage(),
    SearchPage(),
    CreatePostPage(),
    NotificationsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // 기본 탭바 컨트롤러로 탭과 컨텐츠 동기화.
      length: 5, // 몇 개인지
      initialIndex: 0, // 시작 index
      child: Scaffold(
        appBar: AppBar(
          title: Text("Instagram", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TabBar(
            // 텝바
            tabs: <Widget>[
              Tab(
                // 텝당 아이콘들
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              ),
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
