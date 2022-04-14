import 'package:flutter/material.dart';
import './posts.dart';

import 'controller/auth_controller.dart';

class LazyLoadingPage extends StatefulWidget {
  @override
  _LazyLoadingPageState createState() => _LazyLoadingPageState();
}

class _LazyLoadingPageState extends State<LazyLoadingPage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF38B6FF),
        title: Text("Lazy Loading Page"),
        actions: [
          new IconButton(
              onPressed: () {
                AuthController.logOut();
              },
              icon: new Icon(Icons.logout))
        ],
      ),
      body: Posts(),
    );
  }
}
