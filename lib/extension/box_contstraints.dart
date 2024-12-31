import 'package:flutter/material.dart';

extension BoxConstraintsGeneralLibFlutterExtension on BoxConstraints {
  /// general
  Orientation get extensionGeneralLibFlutterOrientation =>
      maxWidth > maxHeight ? Orientation.landscape : Orientation.portrait;
}
