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
// ignore_for_file: non_constant_identifier_names


import "package:flutter/material.dart";

extension SizeGeneralLibFlutterExtension on Size {
  Size general_lib_flutter_increaseSize(Size size) {
    return Size(width + size.width, height + size.height);
  }

  Size general_lib_flutter_dereaseSize(Size size) {
    return Size(width - size.width, height - size.height);
  }

  Offset toOffset({
    required Alignment alignment,
  }) {
    
    // dx: horizontal
    // min = left
    // max = right
    //
    // dy: vertical
    // 
    switch (alignment) {
      case Alignment.topRight:
        return Offset(width, 0);
      case Alignment.topLeft:
        return const Offset(0, 0);
      case Alignment.topCenter:
        return Offset(width / 2, 0);

      case Alignment.centerRight:
        return Offset(width, height / 2);

      case Alignment.centerLeft:
        return Offset(0, height / 2);
      case Alignment.center:
        return Offset(width / 2, height / 2);

      case Alignment.bottomRight:
        return Offset(width, height);
      case Alignment.bottomLeft:
        return Offset(0, height);
      case Alignment.bottomCenter:
        return Offset(width / 2, height);
      default:
        return Offset.zero;
    }
  }
}
