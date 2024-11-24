// ignore_for_file: unnecessary_brace_in_string_interps, empty_catches

import 'dart:convert';

import 'package:flutter/services.dart';

class GeneralLibFlutterUtils {
  static Future<List<String>> getAssetsByExtension({
    required String extensionName,
  }) async {
    try {
      final res = await rootBundle.loadString("AssetManifest.json");
      if (res.isNotEmpty) {
        final Map assets = json.decode(res) as Map;
        final List<String> result = <String>[];
        for (final element in assets.entries) {
          final value = element.value;
          if (value is List) {
            for (final valueData in value) {
              if (RegExp("([.]${extensionName})\$", caseSensitive: false)
                  .hasMatch(valueData)) {
                if (result.contains(valueData) == false) {
                  result.add(valueData);
                }
              }
            }
          }
        }
        assets.clear();
        return result;
      }
    } catch (e) {}
    return [];
  }
}
