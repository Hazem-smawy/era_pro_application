import 'package:era_pro_application/src/core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:ui';
import 'era_pro_app.dart';

Future<void> main() async {
  //  Here we are calling the Dependency Injection
  //  This is the main app
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeDateFormatting('en_US', null);
  await initializeDateFormatting('ar', null);
  String deviceLocale = window.locale.toString(); // e.g., "en_US"
  await initializeDateFormatting(deviceLocale.split('_').first, null);

  // Lock orientation to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown, // Optional, if you want reverse portrait
  ]).then((_) async {
    await DependencyInjection.init();
    runApp(const EraProApp());
  });
}

// import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Welcome to Flutter'),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(30),
//             child: TextField(
//               // inputFormatters: [CurrencyTextInputFormatter.currency()],
//               inputFormatters: [
//                 CurrencyTextInputFormatter.simpleCurrency()
//               ], // < for simple
//               // inputFormatters: [CurrencyTextInputFormatter()], < for basic
//               keyboardType: TextInputType.number,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
