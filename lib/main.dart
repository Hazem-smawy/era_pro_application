import 'package:era_pro_application/src/core/config/config.dart';
import 'package:flutter/material.dart';

import 'era_pro_app.dart';

Future<void> main() async {
  //  Here we are calling the Dependency Injection
  //  This is the main app
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyInjection.init();

  runApp(const EraProApp());
}
