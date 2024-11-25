 
import 'package:flutter/scheduler.dart';

class TickerProviderGeneralLibFlutterEmpty extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}