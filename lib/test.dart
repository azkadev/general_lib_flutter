// class ClipboardMonitor {
//   bool _canPaste = false;
//   bool get canPaste => _canPaste;
//   Timer? _timer;

//   void monitorClipboard(bool add, void Function() listener) {
//     if (kIsWeb) return;
//     if (add) {
//       _timer = Timer.periodic(
//           const Duration(seconds: 1), (timer) => _update(listener));
//     } else {
//       _timer?.cancel();
//     }
//   }

//   Future<void> _update(void Function() listener) async {
//     final clipboardService = ClipboardServiceProvider.instance;
//     if (await clipboardService.hasClipboardContent) {
//       _canPaste = true;
//       listener();
//     }
//   }
// }
