import 'package:flutter/material.dart';
import 'package:mis/utils/configuration.dart';

class ContentLayout extends StatelessWidget {
  final Widget child;
  const ContentLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
              child: child,
            )));
  }
}
