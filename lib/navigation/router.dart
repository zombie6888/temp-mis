import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:routemaster/routemaster.dart';
import 'navigation_observer.dart';
import 'routes.dart';

class RouteOptions {
  RouteOptions(
      {required this.showBottomBar, required this.showAppBar, this.title});

  final String? title;

  final bool showBottomBar;
  final bool showAppBar;
}

class CustomRouterDelegate extends RoutemasterDelegate {
  CustomRouterDelegate(
      {required super.routesBuilder,
      super.observers = const [],
      required this.router});
  CustomRouter router;
  // @override
  // GlobalKey<NavigatorState>? get navigatorKey => GlobalKey();

  @override
  Future<bool> popRoute() {
    print('pop route');
    return router.handleBack(history);
  }
}

class CustomRouter {
  final NavigationObserver observer;
  CustomRouter(this.observer);

  Future<bool> _defaultBackHandler(RouteHistory history) {
    if (!kIsWeb && observer.currentPath == '/goals' && Platform.isAndroid) {
      SystemNavigator.pop();
    }
    history.back();
    return Future.value(true);
  } 

  Future<bool> Function(RouteHistory history)? _backHandler;

  handleBack(RouteHistory history) {
    return _backHandler != null
        ? _backHandler!(history)
        : _defaultBackHandler(history);
  }

  addBackHandler(Future<bool> Function(RouteHistory history) handler) {
    _backHandler = handler;
  }

  removeBackHandler() {
    _backHandler = null;
  }

  final _routeOptions = {
    '/catalog/product/:id': RouteOptions(showAppBar: true, showBottomBar: false)
  };

  RouteOptions? get routeOptions => _routeOptions[observer.currentPath];

  // Возвращает true если роут является дочерним для табы
  bool isTabChild() {
    final currentPath = observer.currentPath;
    return isTab() &&
        !tabs.keys.any((route) => route == currentPath.replaceAll('/:id', ''));
  }

  bool isTab() {
    final currentPath = observer.currentPath;
    final pathSegments = currentPath.split('/');
    return pathSegments.length > 1
        ? tabs.keys.any((route) => route == '/${pathSegments[1]}')
        : currentPath == '/';
  }

  // Возвращает заголовок для appBar вложенных в табы экранов
  String getTabPageTitle(int tabIndex, BuildContext context) {   
    final path = isTab() ? observer.currentPath : observer.previousPath;
    if (path.isEmpty) {
      return tabs.values.toList()[tabIndex];
    }
    //final tabTitles = defaultTitles.values.toList();
    return titles[path] ?? ''; //?? tabTitles[tabIndex];
  }
}
