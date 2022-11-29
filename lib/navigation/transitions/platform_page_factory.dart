import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:routemaster/routemaster.dart';

import 'slide_left_transition.dart';

enum AnimationDirection { left, down, up, right }

// Фабрика страниц для routemaster с поддержкой разных направлений анимации
// и жестов на ios
//
//TODO: поменять left на right и переименовать классы так как страница выезжает справа
class PlatformPageFactory {
  static Page<dynamic> getPage(
      {AnimationDirection direction = AnimationDirection.left,
      LocalKey? key,
      String? restorationId,
      required Widget child}) {
    //TODO: Добавить направления анимаций для ios, не поломав жест назад
    if (!kIsWeb && Platform.isIOS) {
      return CupertinoPage(child: child);
    } else {
      PageTransition transition = SlideLeftTransition();
      if (direction == AnimationDirection.left) {
        transition = SlideLeftTransition();
      }
      // if (direction == AnimationDirection.up) {
      //   transition = SlideUpTransition();
      // }
      // if (direction == AnimationDirection.down) {
      //   transition = SlideDownTransition();
      // }
      return TransitionPage(
          key: key,
          restorationId: restorationId,
          pushTransition: transition, popTransition: transition, child: child);
    }
  }
}
