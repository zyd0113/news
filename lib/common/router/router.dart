import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutternews/pages/application/application.dart';
import 'package:flutternews/pages/details/details.dart';
import 'package:flutternews/pages/index/index.dart';
import 'package:flutternews/pages/sign_in/sign_in.dart';
import 'package:flutternews/pages/sign_up/sign_up.dart';
import 'package:flutternews/pages/welcome/welcome.dart';

import 'auth_grard.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $AppRouter {
  @initial//启动路由标志
  IndexPage indexPageRoute;

  WelcomePage welcomePageRoute;

  SignInPage signInPageRoute;

  SignUpPage signUpPageRoute;
  @GuardedBy([AuthGuard]) // 路由守卫
  ApplicationPage applicationPageRoute;
  @GuardedBy([AuthGuard]) // 路由守卫
  DetailsPage detailsPageRoute;
}