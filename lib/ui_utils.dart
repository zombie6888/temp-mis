import 'package:flutter/material.dart';
import 'package:mis/utils/translator.dart';
import 'package:provider/provider.dart';

import 'utils/modal.dart';
import 'utils/screen_utils.dart';

class UiUtils extends StatelessWidget {
  final Widget? child;
  const UiUtils({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenUtils = ScreenUtils(mediaQueryData);
    final translator = Translator(context);    

    return MultiProvider(
        providers: [
          Provider.value(value: screenUtils),
          ChangeNotifierProvider.value(value: translator),         
        ], child: child);
  }
}
