import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutternews/common/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

//对toast二次封装
Future<bool> toastInfo({
  @required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT, //时间长短
    gravity: ToastGravity.TOP, //位置
    timeInSecForIos: 1,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: duSetFontSize(16),
  );
}