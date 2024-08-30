// import 'package:flutter/material.dart';
// import 'package:general_lib_flutter/widget_to_image/controller.dart';

// class WidgetToImageWidget extends StatelessWidget {
//   final WidgetToImageController widgetToImageController;
//   final Widget Function(BuildContext context, WidgetToImageController widgetToImageController) builder;
//   const WidgetToImageWidget({
//     super.key,
//     required this.widgetToImageController,
//     required this.builder,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return RepaintBoundary(
//       key: widgetToImageController.globalKey,
//       child: ListenableBuilder(
//         listenable: widgetToImageController,
//         builder: (context, child) {
//           if (widgetToImageController.is_procces) {
//             WidgetsBinding.instance.endOfFrame.then((_) async {
//               await widgetToImageController.captureWidget();
//             });
//           }
//           return builder(context, widgetToImageController);
//         },
//       ),
//     );
//   }
// }
