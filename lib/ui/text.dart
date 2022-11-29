import 'package:flutter/material.dart';

class CustomText {
  final MediaQueryData _data;
  double _scaleFactor = 1;

  setScaleFactor(double multiple) {
    _scaleFactor = multiple;
  }

  CustomText(this._data) {
    final width = _data.size.width.toInt();
    if (width < 320) {
      setScaleFactor(0.8);
    } else if (width < 360) {
      setScaleFactor(0.85);
    } else if (width <= 375) {
      setScaleFactor(1);
    } else if (width <= 390) {
      setScaleFactor(1);
    } else if (width <= 414) {
      setScaleFactor(1);
    } else if (width <= 428) {
      setScaleFactor(1);
    }
  }

  TextStyle t12400() => TextStyle(
        fontFamily: 'Noto Sans',
        color: Colors.black,
        fontSize: 12 * _scaleFactor,
        fontWeight: FontWeight.w400,
      );

  TextStyle t12600() => TextStyle(
        fontFamily: 'Noto Sans',
        color: Colors.black,
        fontSize: 12 * _scaleFactor,
        fontWeight: FontWeight.w600,
      );

  TextStyle t15400() => TextStyle(
        fontFamily: 'Noto Sans',
        color: Colors.black,
        fontSize: 15 * _scaleFactor,
        fontWeight: FontWeight.w400,
      );

  TextStyle t15600() => TextStyle(
        fontFamily: 'Noto Sans',
        color: Colors.black,
        fontSize: 15 * _scaleFactor,
        fontWeight: FontWeight.w600,
      );

  TextStyle t20700() => TextStyle(
        fontFamily: 'Noto Sans',
        color: Colors.black,
        fontSize: 20 * _scaleFactor,
        fontWeight: FontWeight.w700,
      );

  TextStyle t20400() => TextStyle(
        fontFamily: 'Noto Sans',
        color: Colors.black,
        fontSize: 20 * _scaleFactor,
        fontWeight: FontWeight.w400,
      );

  TextStyle t24600() => TextStyle(
        fontFamily: 'Noto Sans',
        color: Colors.black,
        fontSize: 24 * _scaleFactor,
        fontWeight: FontWeight.w600,
      );
}

// class CustomTextStyle {
//   CustomTextStyle._();
//   double _scaleFactor = 1;

//   setScaleFactor(double multiple) {
//     _scaleFactor = multiple;
//   }

//   static CustomTextStyle of(BuildContext context) {
//     // final dpi = MediaQuery.of(context).devicePixelRatio;
//     final width = MediaQuery.of(context).size.width.toInt();
//     final instance = CustomTextStyle._();
//     //logger.d(width);
//     //logger.d(MediaQuery.of(context).size.height);
//     //logger.d(MediaQuery.of(context).devicePixelRatio.toString());
//     //428 390 375 414 320 360
//     if (width < 320) {
//       instance.setScaleFactor(0.8);
//     } else if (width < 360) {
//       instance.setScaleFactor(0.85);
//     } else if (width <= 375) {
//       instance.setScaleFactor(1);
//     } else if (width <= 390) {
//       instance.setScaleFactor(1);
//     } else if (width <= 414) {
//       instance.setScaleFactor(1);
//     } else if (width <= 428) {
//       instance.setScaleFactor(1);
//     }
//     return instance;
//   }

//   //1
//   TextStyle t12400() => TextStyle(
//         fontFamily: 'Noto Sans',
//         color: Colors.black,
//         fontSize: 12 * _scaleFactor,
//         fontWeight: FontWeight.w400,
//       );

//   TextStyle t12600() => TextStyle(
//         fontFamily: 'Noto Sans',
//         color: Colors.black,
//         fontSize: 12 * _scaleFactor,
//         fontWeight: FontWeight.w600,
//       );

//   TextStyle t15400() => TextStyle(
//         fontFamily: 'Noto Sans',
//         color: Colors.black,
//         fontSize: 15 * _scaleFactor,
//         fontWeight: FontWeight.w400,
//       );

//   TextStyle t15600() => TextStyle(
//         fontFamily: 'Noto Sans',
//         color: Colors.black,
//         fontSize: 15 * _scaleFactor,
//         fontWeight: FontWeight.w600,
//       );

//   TextStyle t20700() => TextStyle(
//         fontFamily: 'Noto Sans',
//         color: Colors.black,
//         fontSize: 20 * _scaleFactor,
//         fontWeight: FontWeight.w700,
//       );

//   TextStyle t20400() => TextStyle(
//         fontFamily: 'Noto Sans',
//         color: Colors.black,
//         fontSize: 20 * _scaleFactor,
//         fontWeight: FontWeight.w400,
//       );

//   TextStyle t24600() => TextStyle(
//         fontFamily: 'Noto Sans',
//         color: Colors.black,
//         fontSize: 24 * _scaleFactor,
//         fontWeight: FontWeight.w600,
//       );
// }
