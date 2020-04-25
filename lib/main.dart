import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/common/provider/app.dart';
import 'package:flutternews/global.dart';
import 'package:flutternews/pages/index/index.dart';
import 'package:flutternews/routes.dart';
import 'package:provider/provider.dart';

import 'common/router/auth_grard.dart';
import 'common/router/router.gr.dart';

// void main()=>runApp(MyApp());
// void main() => Global.init().then((e) => runApp(
//       MultiProvider(
//         providers: [
//           ChangeNotifierProvider<AppState>.value(
//             value: Global.appState,
//           ),
//         ],
//         child: MyApp(),
//       ),
//     ));

void main() => Global.init().then((e) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>.value(
            value: Global.appState,
          ),
        ],
        child: Consumer<AppState>(builder: (context, appState, _) {
          if (appState.isGrayFilter) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
              child: MyApp(),
            );
          } else {
            return MyApp();
          }
        }),
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ducafecat.tech',
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator<AppRouter>(
        initialRoute: Routes.indexPageRoute,
        router: AppRouter(),
        guards: [AuthGuard()],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       debugShowCheckedModeBanner: false,
//       routes:staticRoutes,
//       home: IndexPage(),
//     );
//   }
// }

