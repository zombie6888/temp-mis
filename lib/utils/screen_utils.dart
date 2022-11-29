import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../ui/text.dart';
import 'configuration.dart';

class ScreenUtils {
  final MediaQueryData _data;
  final CustomText text;
  ScreenUtils(this._data, {Widget? child}) : text = CustomText(_data);

  bool get isDesktop => kIsWeb && _data.size.width > navigationRailTreshold;

  double getContentHorizontalPadding(double contentSize) {
    if (contentSize >= _data.size.width) {
      return 0;
    }
    return (_data.size.width - contentSize) / 2;
  } 
}
