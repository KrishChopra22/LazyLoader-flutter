import 'dart:convert';

import 'package:flutter_lazy_app/lazy_loading_page.dart';
import 'package:flutter_lazy_app/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthController {
  static login(Map userData) async {
    print(userData);

    var response = {"user_id": "99", "user_token": "xx8894jjdsdhsuur"};
    var any = await SharedPreferences.getInstance();

    any.setString("userData", json.encode(response));
    Get.off(LazyLoadingPage());
  }

  Future<bool> tryAutoLogin() async {
    var any = await SharedPreferences.getInstance();
    if (!any.containsKey("userData")) {
      return false;
    } else {
      // final extractedUserData =
      //     json.decode(any.getString('userData').toString());

      // print(extractedUserData['user_id']);
      // print(extractedUserData['user_token']);

      return true;
    }
  }

  static logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.off(() => MyLogin());
  }
}
