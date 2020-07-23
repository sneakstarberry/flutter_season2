import 'package:flutter/material.dart';
import 'package:instagram2/models/global.dart';
import 'package:instagram2/models/user.dart';

class GetStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: user.following.length * 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          User follower = user.following[index % 5];
          return Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  child: Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundColor:
                              follower.hasStory ? Colors.red : Colors.grey,
                        ),
                      ),
                      Container(
                        height: 47,
                        width: 47,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        child: CircleAvatar(
                          backgroundImage: follower.profilePicture,
                        ),
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
