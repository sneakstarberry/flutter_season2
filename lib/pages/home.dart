import 'package:flutter/material.dart';
import 'package:instagram2/models/global.dart';
import 'package:instagram2/models/post.dart';
import 'package:instagram2/provider/page.dart';
import 'package:instagram2/widgets/getComments.dart';
import 'package:instagram2/widgets/getLikes.dart';
import 'package:instagram2/widgets/getPosts.dart';
import 'package:instagram2/widgets/getStories.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static int page = 1;
  @override
  Widget build(BuildContext context) {
    int page = Provider.of<PostPage>(context).page;
    Map<int, Widget> pageview = {
      // 맵 형식을 통해 위젯변경
      1: GetMain(),
      2: GetLikes(),
      3: GetComments(),
    };
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position:
              animation.drive(Tween(begin: Offset(1.0, 0.0), end: Offset.zero)),
          child: child,
        );
      },
      child: pageview[page],
    );
  }
}

class GetMain extends StatelessWidget {
  static int page = 1;
  static Post thePost = post1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          Column(
            children: [
              Container(
                height: 85,
                child: GetStories(),
              ),
              Column(
                children: [
                  GetPosts(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
