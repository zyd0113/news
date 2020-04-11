import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutternews/global.dart';
import 'package:flutternews/pages/application/application.dart';
import 'package:flutternews/pages/sign_in/sign_in.dart';
import 'package:flutternews/pages/welcome/welcome.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );

    return Scaffold(
      body: Global.isFirstOpen == true
          ? WelcomePage()
          : Global.isOffLineLogin == true ? ApplicationPage() : SignInPage(),
    );
  }
}