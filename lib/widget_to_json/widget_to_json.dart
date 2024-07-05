/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart' as material_widget;
import 'package:flutter/rendering.dart';

extension WidgetToJson on material_widget.Widget {
  Map toMap() {
    Map jsonData = {
      "@type": runtimeType.toString(),
    };
    // print("Saoskasoakso");
    final DiagnosticPropertiesBuilder builder = DiagnosticPropertiesBuilder();
    debugFillProperties(builder);
    // debugFillProperties(properties)
    for (var element in builder.properties) {
      jsonData[element.name] = element.value;
    }
    return jsonData;
  }

  Map toJson() {
    return widgetToJson(widget: this);
  }
}

extension WidgetNullToJson on material_widget.Widget? {
  Map toMap() {
    Map jsonData = {
      "@type": runtimeType.toString(),
    };
    // print("Saoskasoakso");
    final DiagnosticPropertiesBuilder builder = DiagnosticPropertiesBuilder();
    this!.debugFillProperties(builder);
    // debugFillProperties(properties)
    for (var element in builder.properties) {
      jsonData[element.name] = element.value;
    }
    return jsonData;
  }

  Map? toJson() {
    return widgetToJson(
        widget: this ?? const material_widget.SizedBox.shrink());
  }
}

Map widgetToJson({
  required material_widget.Widget widget,
  material_widget.Widget? notSupportedWidget,
}) {
  Map jsonData = {
    "@type": widget.runtimeType.toString(),
  };

  if (widget is material_widget.MaterialApp) {
    material_widget.MaterialApp widget_procces = widget;
    jsonData["home"] = widget_procces.home.toJson();
  } else if (widget is material_widget.Scaffold) {
    material_widget.Scaffold widget_procces = widget;

    jsonData["body"] = widget.body.toJson();
  } else if (widget is material_widget.Center) {
    material_widget.Center widget_procces = widget;
    jsonData["child"] = widget.child.toJson();
  } else if (widget is material_widget.Text) {
    material_widget.Text widget_procces = widget;
    jsonData["data"] = widget.data;
  } else if (widget is material_widget.Column ||
      widget is material_widget.Row) {
    List<Map> children = [];
    if (widget is material_widget.Column) {
      material_widget.Column widget_procces = widget;
      for (var element in widget_procces.children) {
        children.add(element.toJson());
      }
    } else if (widget is material_widget.Row) {
      material_widget.Row widget_procces = widget;
      for (var element in widget_procces.children) {
        children.add(element.toJson());
      }
    }
    jsonData["children"] = children;
  } else {
    if (notSupportedWidget != null) {
      notSupportedWidget.toJson().forEach((key, value) {
        jsonData[key] = value;
      });
    } else {
      widget.toMap().forEach((key, value) {
        jsonData[key] = value;
      });
    }
  }
  return jsonData;
}
