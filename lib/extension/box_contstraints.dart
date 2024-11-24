import 'package:flutter/material.dart';

extension BoxConstraintsGeneralLibFlutterExtension on BoxConstraints {
  Orientation get extensionGeneralLibFlutterOrientation =>
      maxWidth > maxHeight ? Orientation.landscape : Orientation.portrait;
}
