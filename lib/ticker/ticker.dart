import 'package:flutter/scheduler.dart';

/// GeneralLibraryFlutter
class TickerProviderGeneralLibFlutterEmpty extends TickerProvider {
  /// GeneralLibraryFlutter
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
