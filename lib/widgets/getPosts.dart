import 'package:flutter/material.dart';
import 'package:instagram2/models/global.dart';
import 'package:instagram2/models/post.dart';
import 'package:instagram2/provider/page.dart';
import 'package:provider/provider.dart';

class GetPosts extends StatefulWidget {
  @override
  _GetPostsState createState() => _GetPostsState();
}

class _GetPostsState extends State<GetPosts> {
  @override
  Widget build(BuildContext context) {
    final postPage = Provider.of<PostPage>(context);
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: userPosts.length,
      itemBuilder: (context, index) {
        Post post = userPosts[index];
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            backgroundImage: post.user.profilePicture,
                          ),
                        ),
                        Text(
                          post.user.username,
                        )
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 1),
                color: Colors.grey,
              ),
              Container(
                constraints: BoxConstraints(maxHeight: 285),
                decoration: BoxDecoration(
                  image: DecorationImage(image: post.image),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment(0, 0),
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            size: 30,
                            color: post.isLiked ? Colors.red : Colors.black,
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite),
                            color: post.isLiked ? Colors.red : Colors.white,
                            onPressed: () {
                              setState(() {
                                userPosts[index].isLiked =
                                    post.isLiked ? false : true;
                                if (!post.isLiked) {
                                  post.likes.remove(user);
                                } else {
                                  post.likes.add(user);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment(0, 0),
                        children: <Widget>[
                          Icon(Icons.mode_comment,
                              size: 30, color: Colors.black),
                          IconButton(
                              icon: Icon(Icons.mode_comment),
                              color: Colors.white,
                              onPressed: () {}),
                        ],
                      ),
                      Stack(
                        alignment: Alignment(0, 0),
                        children: <Widget>[
                          Icon(Icons.send, size: 30, color: Colors.black),
                          IconButton(
                            icon: Icon(Icons.send),
                            color: Colors.white,
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(
                        Icons.bookmark,
                        size: 30,
                        color: Colors.black,
                      ),
                      IconButton(
                        icon: Icon(Icons.bookmark),
                        color: post.isSaved ? Colors.black : Colors.white,
                        onPressed: () {
                          setState(() {
                            userPosts[0].isSaved = post.isSaved ? false : true;
                            if (!post.isSaved) {
                              user.savedPosts.remove(post);
                            } else {
                              user.savedPosts.add(post);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              FlatButton(
                child: Text(post.likes.length.toString() + " likes"),
                onPressed: () {
                  postPage.setPage(2);
                  postPage.setPost(post);
                },
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 10),
                    child: Text(post.user.username),
                  ),
                  Text(post.description),
                ],
              ),
              FlatButton(
                child: Text("View all " +
                    post.comments.length.toString() +
                    " comments"),
                onPressed: () {
                  postPage.setPage(3);
                  postPage.setPost(post);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
