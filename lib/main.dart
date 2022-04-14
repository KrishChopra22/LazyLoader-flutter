import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lazy_app/login_page.dart';
import 'controller/auth_controller.dart';
import 'lazy_loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lazy Loader - Krish',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      routes: {
        'login': ((context) => MyLogin()),
        'lazyloading': ((context) => LazyLoadingPage()),
      },
      home: FutureBuilder(
          future: authController.tryAutoLogin(),
          builder: (contect, authResult) {
            if (authResult.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF38B6FF))),
              );
            } else {
              if (authResult.data == true) {
                return LazyLoadingPage();
              }
              return MyLogin();
            }
          }),
    );
  }
}
