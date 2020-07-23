import 'package:flutter/material.dart';
import 'package:instagram2/models/comment.dart';
import 'package:instagram2/models/global.dart';
import 'package:instagram2/provider/page.dart';
import 'package:provider/provider.dart';

class GetComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostPage postPage = Provider.of<PostPage>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      postPage.setPage(1);
                    },
                  ),
                  Text(
                    'Comments',
                    style: textStyleBold,
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.send, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: postPage.thePost.comments.length,
          itemBuilder: (context, index) {
            return GetComment(comment: postPage.thePost.comments[index]);
          },
        ),
      ),
    );
  }
}

class GetComment extends StatefulWidget {
  final Comment comment;

  GetComment({this.comment});

  @override
  _GetCommentState createState() => _GetCommentState();
}

class _GetCommentState extends State<GetComment> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    int hoursAgo = (now.hour) - (widget.comment.dateOfComment.hour - 1);
    return Container(
      padding: EdgeInsets.all(10),
      child: FlatButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    backgroundImage: widget.comment.user.profilePicture,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: widget.comment.user.username,
                              style: textStyleBold),
                          TextSpan(text: '  ', style: textStyle),
                          TextSpan(
                              text: widget.comment.comment, style: textStyle),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 20),
                          child: Text(
                            hoursAgo.toString() + "h",
                            style: textStyleLigthGrey,
                          ),
                        ),
                        Container(
                          child: Text("like", style: textStyleLigthGrey),
                          margin: EdgeInsets.only(right: 10, top: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  child: Icon(Icons.favorite, color: Colors.black, size: 15),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.favorite,
                        color: widget.comment.isLiked
                            ? Colors.black
                            : Colors.white,
                        size: 10),
                    onPressed: () {
                      setState(() {
                        widget.comment.isLiked =
                            widget.comment.isLiked ? false : true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
