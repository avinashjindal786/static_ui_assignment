// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:flutter_assignment/UI/auth/login.dart' as _i2;
import 'package:flutter_assignment/UI/home/detail_screen.dart' as _i5;
import 'package:flutter_assignment/UI/home/home_screen.dart' as _i4;
import 'package:flutter_assignment/UI/splash_screen/splash_screen.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const loginScreen = '/login-screen';

  static const splashScreen = '/';

  static const homeScreen = '/home-screen';

  static const detailScreen = '/detail-screen';

  static const all = <String>{
    loginScreen,
    splashScreen,
    homeScreen,
    detailScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i2.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.splashScreen,
      page: _i3.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.homeScreen,
      page: _i4.HomeScreen,
    ),
    _i1.RouteDef(
      Routes.detailScreen,
      page: _i5.DetailScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(
        orElse: () => const LoginScreenArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i2.LoginScreen(key: args.key),
        settings: data,
      );
    },
    _i3.SplashScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.SplashScreen(),
        settings: data,
      );
    },
    _i4.HomeScreen: (data) {
      final args = data.getArgs<HomeScreenArguments>(
        orElse: () => const HomeScreenArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i4.HomeScreen(key: args.key, imagepaths: args.imagepaths),
        settings: data,
      );
    },
    _i5.DetailScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i5.DetailScreen(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginScreenArguments {
  const LoginScreenArguments({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class HomeScreenArguments {
  const HomeScreenArguments({
    this.key,
    this.imagepaths = const [
      "assets/images/image1.jpeg",
      "assets/images/image2.jpeg",
      "assets/images/image3.jpeg"
    ],
  });

  final _i6.Key? key;

  final List<String> imagepaths;

  @override
  String toString() {
    return '{"key": "$key", "imagepaths": "$imagepaths"}';
  }

  @override
  bool operator ==(covariant HomeScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.imagepaths == imagepaths;
  }

  @override
  int get hashCode {
    return key.hashCode ^ imagepaths.hashCode;
  }
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToLoginScreen({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        arguments: LoginScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeScreen({
    _i6.Key? key,
    List<String> imagepaths = const [
      "assets/images/image1.jpeg",
      "assets/images/image2.jpeg",
      "assets/images/image3.jpeg"
    ],
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeScreen,
        arguments: HomeScreenArguments(key: key, imagepaths: imagepaths),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.detailScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreen({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginScreen,
        arguments: LoginScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeScreen({
    _i6.Key? key,
    List<String> imagepaths = const [
      "assets/images/image1.jpeg",
      "assets/images/image2.jpeg",
      "assets/images/image3.jpeg"
    ],
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeScreen,
        arguments: HomeScreenArguments(key: key, imagepaths: imagepaths),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.detailScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
