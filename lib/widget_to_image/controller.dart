// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:general_lib_flutter/extension/extension.dart';

// class WidgetToImageController extends ChangeNotifier {
//   final GlobalKey globalKey = GlobalKey();
//   bool is_procces = false;
//   bool is_waiting = false;

//   Future<bool> captureWidget({
//     double? pixelRatio,
//   }) async {
//     if (is_waiting) {
//       return false;
//     }
//     is_waiting = true;
//     is_procces = true;
//     notifyListeners();
//     Future(() async {
//       try {
//         BuildContext? context = globalKey.currentContext;
//         if (context != null) {
//           await context.toImagePng(
//             pixelRatio: pixelRatio ?? context.mediaQueryData.devicePixelRatio,
//           );
//         }
//       } catch (e) {
//         print(e);
//       }
//       is_waiting = false;
//       notifyListeners();
//     });
//     is_procces = false;
//     notifyListeners();
//     return true;
//   }
// }
