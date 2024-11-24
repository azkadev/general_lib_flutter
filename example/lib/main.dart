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
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import "package:general_lib_flutter/general_lib_flutter.dart";

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return route.toMaterialApp();
  }

  final RouteGeneralLibFlutter route = RouteGeneralLibFlutter(
    onNotFoundRoute: (context, routeData) {
      return const HomePage();
    },
    onErrorRoute: (context, routeData) {
      return const HomePage();
    },
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Count:"),
            LinearProgressIndicator(
              value: value,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.pageStorageBucket.writeState(context, "slewlpalsp", identifier: "args");
          context
              .navigator()
              .pushNamed("/sign/sasa/dalplpe/fepltpee/epl", arguments: "Asa");
          // context.routeGeneralLibFlutterPushNamed(routeName: "/sign", parameters: context);
          // context.navigator().push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return SignPage();
          //     },
          //   ),
          //   // ModalRoute.withName('/'),
          // );

          // handleFunction(
          //   onFunction: (context, statefulWidget) async {
          //     if (value >= 1) {
          //       value = 0;
          //     }
          //     setState(() {});
          //     while (true) {
          //       await Future.delayed(const Duration(milliseconds: 10));
          //       value += 0.001;

          //       setState(() {});
          //       if (value >= 1) {
          //         break;
          //       }
          //     }
          //   },
          // );
        },
      ),
    );
  }
}

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Page"),
      ),
    );
  }
}
