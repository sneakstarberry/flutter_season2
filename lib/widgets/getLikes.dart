import 'package:flutter/material.dart';
import 'package:instagram2/models/global.dart';
import 'package:instagram2/models/user.dart';
import 'package:instagram2/provider/page.dart';
import 'package:provider/provider.dart';

class GetLikes extends StatefulWidget {
  @override
  _GetLikesState createState() => _GetLikesState();
}

class _GetLikesState extends State<GetLikes> {
  @override
  Widget build(BuildContext context) {
    List<User> likers = Provider.of<PostPage>(context).thePost.likes;
    PostPage postPage = Provider.of<PostPage>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Likes", style: textStyleBold),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            postPage.setPage(1);
          },
        ),
      ),
      body: Container(
        child: ListView.builder(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: likers.length,
          itemBuilder: (context, index) {
            User follower = likers[index];
            return Container(
              height: 45,
              padding: EdgeInsets.all(10),
              child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(follower.username, style: textStyleBold),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        child: FlatButton(
                          color: user.following.contains(follower)
                              ? Colors.white
                              : Colors.blue,
                          child: Text(
                            user.following.contains(follower)
                                ? "Following"
                                : "Follow",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: user.following.contains(follower)
                                    ? Colors.grey
                                    : Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              if (user.following.contains(follower)) {
                                user.following.remove(follower);
                              } else {
                                user.following.add(follower);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {}),
            );
          },
        ),
      ),
    );
  }
}
