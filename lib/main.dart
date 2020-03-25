import 'package:flutter/material.dart';
import 'package:flutternews/routes.dart';
import 'pages/welcome/welcome.dart';

void main()=>runApp(MyApp());

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