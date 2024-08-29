import 'dart:convert';

import 'package:flutter/material.dart';
// import '../../models/user/user_model.dart';
import '../storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  final LocalStorage localStorage = LocalStorage();
  // UserModel user = UserModel();
  bool isLogin = false;

  SessionController._internal();

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    await localStorage.setValue('token', jsonEncode(user));
    // Storing value to check login
    await localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLoginData = await localStorage.readValue('isLogin');

      if (userData != null && userData.isNotEmpty) {
        // _session.user = UserModel.fromJson(jsonDecode(userData));
       
      }
      _session.isLogin = isLoginData == 'true';
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
