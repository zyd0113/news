import 'package:flutter/material.dart';
import 'package:flutternews/global.dart';
import 'package:flutternews/routes.dart';
import 'pages/welcome/welcome.dart';

// void main()=>runApp(MyApp());
void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes:staticRoutes,
      home: WelcomePage(),
    );
  }
}