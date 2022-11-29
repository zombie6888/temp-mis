import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/router.dart';
import 'screen_utils.dart';

class Modal {
  final BuildContext _context;
  final ScreenUtils _utils;
  Modal(this._context, this._utils);
  //Отключаем хардварный жест навигации
  Future<bool> preventHardwareBack(CustomRouter router) {
    Navigator.of(_context).pop();
    router.removeBackHandler();
    return Future.value(true);
  }

  void showErrorModal(String title, String message,
      [VoidCallback? refetchHandler]) {
    showDialog<String>(
      barrierColor: Colors.white.withOpacity(0.5),
      context: _context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          if (refetchHandler == null)
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          if (refetchHandler != null)
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                refetchHandler();
              },
              child: const Text('Попробовать снова'),
            ),
        ],
      ),
    );
  }

  close() {
    Navigator.pop(_context, 'OK');
  }

  // Модалка для превью картинок.
  // C поддержкой hero animations и back навигации
  // showPreviewModal(Widget content) {
  //   final router = _context.read<CustomRouter>();
  //   router.addBackHandler((_) => preventHardwareBack(router));
  //   Navigator.of(_context)
  //       .push(PreviewModalRoute(builder: (BuildContext context) {
  //     return content;
  //   }));
  // }

  void showFullscreenModal(
      {required Widget content, Color? backgroundColor, Color? closeBtnColor}) {
    final router = _context.read<CustomRouter>();
    router.addBackHandler((nav) => preventHardwareBack(router));
    showDialog<String>(
        context: _context,
        builder: (context) => Scaffold(
              body: Builder(builder: (context) {
                return Container(
                    color: backgroundColor ?? Colors.white,
                    child: Stack(children: [
                      content,
                      Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.close,
                                  color: closeBtnColor ?? Colors.black),
                            ),
                          )),
                    ]));
              }),
            )).then((exit) {
      router.removeBackHandler();
    });
  }

  void showAdaptiveModal(
      {required Widget content, double desktopHeight = 500}) {
    final screenUtils = _utils;
    if (screenUtils.isDesktop) {
      showModal(content: content, height: desktopHeight);
      return;
    }
    showBottomSheet(content: content, dynamicHeight: true);
  }

  void showModal(
      {required Widget content,
      double width = 400,
      double height = 400,
      Color? backgroundColor,
      Color? closeBtnColor}) {
    final router = _context.read<CustomRouter>();
    router.addBackHandler((nav) => preventHardwareBack(router));
    showDialog<String>(
        //barrierColor: Colors.transparent,
        context: _context,
        builder: (context) => SizedBox(
              width: width,
              height: height,
              child: AlertDialog(
                content: SizedBox(
                  width: width,
                  height: height,
                  child: Container(
                      //width: width,
                      //height: height,
                      color: backgroundColor ?? Colors.white,
                      child: Stack(children: [
                        content,
                        Positioned(
                            top: 5,
                            right: 5,
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.close,
                                      color: closeBtnColor ?? Colors.black),
                                ),
                              ),
                            )),
                      ])),
                ),
                // child: Container(
                //         //width: width,
                //         //height: height,
                //         color: backgroundColor ?? Colors.white,
                //         child: Stack(children: [
                //           content,
                //           Positioned(
                //               top: 5,
                //               right: 5,
                //               child: Material(
                //                 child: InkWell(
                //                   onTap: () {
                //                     Navigator.of(context).pop();
                //                   },
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: Icon(Icons.close,
                //                         color: closeBtnColor ?? Colors.black),
                //                   ),
                //                 ),
                //               )),
                //         ])),
              ),
            )).then((exit) {
      router.removeBackHandler();
    });
  }

  showPositionedPopup(
      {required Widget content,
      Color? backgroundColor,
      double? left,
      double? top,
      double? right,
      double? bottom,
      double? width,
      Color? closeBtnColor}) {
    final router = _context.read<CustomRouter>();
    router.addBackHandler((nav) => preventHardwareBack(router));
    showDialog<String>(
        context: _context,
        builder: (context) => LayoutBuilder(builder: (context, constraints) {
              return Stack(
                //fit: StackFit.expand,
                children: [
                  Positioned(
                    right: right,
                    left: left,
                    top: top,
                    bottom: bottom,
                    child: Material(
                      child: Container(
                          height: constraints.maxHeight,
                          width: width,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: content),
                    ),
                  ),
                ],
              );
            })).then((exit) {
      router.removeBackHandler();
    });
  }

  void showBottomSheet(
      {required Widget content,
      double? height,
      void Function()? onTapClose,
      // Если true, Размер шторки определяется контентом
      bool dynamicHeight = false}) {
    final router = _context.read<CustomRouter>();
    router.addBackHandler((nav) => preventHardwareBack(router));
    //print('show bottom sheet');
    FocusScope.of(_context).unfocus();
    showModalBottomSheet(
        isScrollControlled: dynamicHeight,
        //constraints: BoxConstraints(minHeight: height ?? 0),
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        context: _context,
        builder: (context) => Container(
            color: Colors.white,
            height: dynamicHeight ? null : height ?? 200,
            child: Stack(children: [
              content,
              Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      if (onTapClose != null) onTapClose();
                      //FocusScope.of(context).unfocus();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  )),
            ]))).then((exit) => router.removeBackHandler());
  }
}
