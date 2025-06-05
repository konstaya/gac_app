import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'app_router.dart';

import 'constructor/config.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor : Color.fromRGBO(24, 28, 31, 1),
      )
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  //FlutterNativeSplash.remove();

  await GetStorage.init();

  runApp(
      App(
        appRouter: AppRouter(),
        connectivity: Connectivity(),
        flexScheme: GACRules.colorScheme,
        textTheme: GACRules.textTheme,
      )
  );
}