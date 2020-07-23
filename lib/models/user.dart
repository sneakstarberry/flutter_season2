import 'post.dart';
import 'package:flutter/material.dart';

class User {
  String username;
  List<Post> posts;
  AssetImage profilePicture;
  List<User> followers;
  List<User> following;
  List<Post> savedPosts;
  bool hasStory;

  User(this.username, this.profilePicture, this.followers, this.following,
      this.posts, this.savedPosts, this.hasStory);

  @override
  String toString() {
    // TODO: implement toString
    return "{ username: ${this.username}, profilePicture: ${this.profilePicture}, followers: ${this.followers}, following: ${this.following}, posts: ${this.posts},  savedPosts: ${this.savedPosts}, hasStory: ${this.hasStory} }";
  }
}
