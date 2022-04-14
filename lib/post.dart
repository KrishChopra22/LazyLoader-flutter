import 'package:flutter/material.dart';

import './models.dart';

class Post extends StatelessWidget {
  final PostModel post;

  const Post({
    Key? key,
    required this.post,
  })  : assert(post != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15.0,
      color: Color(0xFFCB6CE6),
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 40.0, left: 40.0),
      child: ListTile(
        tileColor: Colors.transparent,
        contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        leading: Image.network(
          post.avatar,
          width: 80.0,
          height: 80.0,
        ),
        title: Text(
          post.body,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
