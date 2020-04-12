import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutternews/common/utils/utils.dart';
import 'package:flutternews/global.dart';
import 'package:flutternews/common/values/values.dart';

//检查是否有token
Future<bool> isAuthenticated() async {
  var profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true:false;
}
//删除缓存token
Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = null;
}
/// 重新登录
Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
  Navigator.pushNamedAndRemoveUntil(
      context, "/sign-in", (Route<dynamic> route) => false);
}