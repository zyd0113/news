// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutternews/pages/index/index.dart';
import 'package:flutternews/pages/welcome/welcome.dart';
import 'package:flutternews/pages/sign_in/sign_in.dart';
import 'package:flutternews/pages/sign_up/sign_up.dart';
import 'package:flutternews/pages/application/application.dart';
import 'package:flutternews/common/router/auth_grard.dart';
import 'package:flutternews/pages/details/details.dart';

abstract class Routes {
  static const indexPageRoute = '/';
  static const welcomePageRoute = '/welcome-page-route';
  static const signInPageRoute = '/sign-in-page-route';
  static const signUpPageRoute = '/sign-up-page-route';
  static const applicationPageRoute = '/application-page-route';
  static const detailsPageRoute = '/details-page-route';
}

class AppRouter extends RouterBase {
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.applicationPageRoute: [AuthGuard],
        Routes.detailsPageRoute: [AuthGuard],
      };

  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<AppRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.indexPageRoute:
        if (hasInvalidArgs<IndexPageArguments>(args)) {
          return misTypedArgsRoute<IndexPageArguments>(args);
        }
        final typedArgs = args as IndexPageArguments ?? IndexPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => IndexPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.welcomePageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => WelcomePage(),
          settings: settings,
        );
      case Routes.signInPageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInPage(),
          settings: settings,
        );
      case Routes.signUpPageRoute:
        if (hasInvalidArgs<SignUpPageArguments>(args)) {
          return misTypedArgsRoute<SignUpPageArguments>(args);
        }
        final typedArgs = args as SignUpPageArguments ?? SignUpPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignUpPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.applicationPageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ApplicationPage(),
          settings: settings,
        );
      case Routes.detailsPageRoute:
        if (hasInvalidArgs<DetailsPageArguments>(args)) {
          return misTypedArgsRoute<DetailsPageArguments>(args);
        }
        final typedArgs =
            args as DetailsPageArguments ?? DetailsPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => DetailsPage(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//IndexPage arguments holder class
class IndexPageArguments {
  final Key key;
  IndexPageArguments({this.key});
}

//SignUpPage arguments holder class
class SignUpPageArguments {
  final Key key;
  SignUpPageArguments({this.key});
}

//DetailsPage arguments holder class
class DetailsPageArguments {
  final Key key;
  DetailsPageArguments({this.key});
}

//**************************************************************************
// Navigation helper methods extension
//***************************************************************************

extension AppRouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushIndexPageRoute({
    Key key,
  }) =>
      pushNamed(Routes.indexPageRoute, arguments: IndexPageArguments(key: key));
  Future pushWelcomePageRoute() => pushNamed(Routes.welcomePageRoute);
  Future pushSignInPageRoute() => pushNamed(Routes.signInPageRoute);
  Future pushSignUpPageRoute({
    Key key,
  }) =>
      pushNamed(Routes.signUpPageRoute,
          arguments: SignUpPageArguments(key: key));
  Future pushApplicationPageRoute() => pushNamed(Routes.applicationPageRoute);
  Future pushDetailsPageRoute({Key key, OnNavigationRejected onReject}) =>
      pushNamed(Routes.detailsPageRoute,
          arguments: DetailsPageArguments(key: key), onReject: onReject);
}
