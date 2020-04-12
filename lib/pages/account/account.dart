import 'package:flutter/material.dart';
import 'package:flutternews/common/provider/app.dart';
import 'package:flutternews/common/utils/utils.dart';
import 'package:flutternews/global.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Column(
      children: <Widget>[
        Text('用户: ${Global.profile.displayName}'),
        Divider(),
        MaterialButton(
          onPressed: () {
            goLoginPage(context);
          },
          child: Text('退出'),
        ),
        Divider(),
        MaterialButton(
          onPressed: () {
            appState.switchGrayFilter();
          },
          child: Text('灰色切换 ${appState.isGrayFilter}'),
        ),
      ],
    );
  }
}
