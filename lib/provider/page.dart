import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagram2/models/global.dart';
import 'package:instagram2/models/post.dart';
import 'package:instagram2/pages/home.dart';
import 'package:instagram2/widgets/getLikes.dart';
import 'package:instagram2/widgets/getComments.dart';

class PostPage with ChangeNotifier {
  int page = 1;
  Post thePost = post1;

  void setPage(int number) {
    this.page = number;
    print(number);
    notifyListeners();
  }

  void setPost(Post post) {
    this.thePost = post;
    print(thePost);
    notifyListeners();
  }
}

// provider 쓰는 이유
// a. 관심사의 분리
//  1. 디자인 원칙의 하나
//  2. 관심사는 코드가 하는 일
//  3. UI를 담당하는 코드, 통신부를 담당하는 코드
// b. 데이터의 공유
//  1. 여러페이지에서 하나의 데이터를 공유
// c. 좀 더 간결한 코드
//  1. 다른 패턴에 비해 간결한 코드
//  2. 복잡도 하락
