import 'package:flutter/material.dart';
import 'package:instagram2/models/global.dart';
import 'package:instagram2/models/post.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    List<Tab> _tabs = [
      Tab(icon: Icon(Icons.apps)),
      Tab(icon: Icon(Icons.assignment_ind)),
    ];
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    color: Colors.grey[100],
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Stack(children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      child: CircleAvatar(
                                        backgroundImage: user.profilePicture,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 22,
                                        width: 22,
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 9,
                                            child: Icon(Icons.add, size: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                '129',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text('posts')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                '129K',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text('followers')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                '129',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text('following')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        user.username,
                                        style: textStyleBold,
                                      ),
                                      Text("I am a profile on instagram"),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.8),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: FlatButton(
                              onPressed: () => {},
                              child: Text("Edit Profile"),
                            ),
                          ),
                        ),
                        Divider(thickness: 0.8, color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    tabs: _tabs,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                  ),
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: TabBarView(children: [
            Builder(
              builder: (context) {
                return CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverFixedExtentList(
                        itemExtent: 125,
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return getPosts()[index];
                          },
                          childCount: getPosts().length,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            Builder(
              builder: (context) {
                return CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverFixedExtentList(
                        itemExtent: 125,
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return getPosts()[index];
                          },
                          childCount: getPosts().length,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ]),
        ),
      ),
    );
  }

  List<Widget> getPosts() {
    List<Widget> postRows = [];
    List<Widget> posts = [];
    int counter = 0;
    for (Post post in userPosts) {
      for (int i = 0; i < 5; i++) {
        double marginLeft = 2;
        if (counter == 3) {
          marginLeft = 0;
        } else if (counter == 0) {
          marginLeft = 0;
        }
        posts.add(getPost(post, marginLeft));
        if (counter == 2) {
          postRows.add(
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: posts,
              ),
            ),
          );
          posts = [];
          counter = 0;
        } else {
          counter++;
        }
      }
    }
    if (posts.length > 0) {
      postRows.add(
        Container(
          child: Row(
            children: posts,
          ),
        ),
      );
    }
    return postRows;
  }

  Widget getPost(Post post, double margin) {
    return Container(
      margin: EdgeInsets.only(left: margin, bottom: 2),
      height: 125,
      width: 123.5,
      decoration: BoxDecoration(
          image: DecorationImage(image: post.image, fit: BoxFit.fill)),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white, // ADD THE COLOR YOU WANT AS BACKGROUND.
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
