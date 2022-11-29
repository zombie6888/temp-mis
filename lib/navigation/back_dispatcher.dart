import 'package:flutter/material.dart';
import 'package:mis/navigation/router.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class BackDispatcher extends StatefulWidget {
  final Future<bool> Function(RouteHistory history) backHandler;
  final Widget child;
  const BackDispatcher(
      {Key? key, required this.backHandler, required this.child})
      : super(key: key);

  @override
  State<BackDispatcher> createState() => _BackDispatcherState();
}

class _BackDispatcherState extends State<BackDispatcher> {
  CustomRouter? _router;

  @override
  void initState() {
    super.initState();
    _router = context.read<CustomRouter>();
    _router?.addBackHandler(widget.backHandler);
  }

  @override
  void dispose() {
    _router?.removeBackHandler();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
