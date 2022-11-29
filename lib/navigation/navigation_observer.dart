import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ChangePathEvent {
  String previousPath;
  String currentPath;
  ChangePathEvent({required this.previousPath, required this.currentPath});
}

class NavigationObserver extends RoutemasterObserver {
  String previousPath = '';
  String currentPath = '';
  Map<String, String> queryParameters = {};

  final _controller = StreamController<ChangePathEvent>.broadcast();

  Stream<ChangePathEvent> get stream => _controller.stream;

  @override
  void didPop(Route route, Route? previousRoute) {
    print('route pop: $route, $previousRoute');
    //queryParameters = route.navigator.c;
  }

  // Routemaster-specific observer method
  @override
  void didChangeRoute(RouteData routeData, Page page) {
    //print('didChangeRoute: $currentPath, $previousPath');
    previousPath = currentPath;
    currentPath = routeData.pathTemplate ?? '';
    queryParameters = routeData.queryParameters;    
    _controller.add(
        ChangePathEvent(currentPath: currentPath, previousPath: previousPath));
    //_controller.close();
    //print('route push: $previousPath, $currentPath');
  }
}
