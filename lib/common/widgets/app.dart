import 'package:flutter/material.dart';
import 'package:flutternews/common/values/values.dart';

/// 透明背景 AppBar
Widget transparentAppBar({
  @required BuildContext context,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,//背景透明
    elevation: 0,
    title: Text(''),//无标题
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,//左回退按钮
        color: AppColors.primaryText,
      ),
      onPressed: () {
        Navigator.pop(context);//左边回退按钮回到上一页
      },
    ),
    actions: actions,//自定义右边按钮
  );
}