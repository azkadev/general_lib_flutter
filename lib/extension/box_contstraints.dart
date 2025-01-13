import 'package:flutter/material.dart';

/// UncompleteDocumentation
extension BoxConstraintsGeneralLibFlutterExtension on BoxConstraints {
  /// general
  Orientation get extensionGeneralLibFlutterOrientation =>
      maxWidth > maxHeight ? Orientation.landscape : Orientation.portrait;
}
