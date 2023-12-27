import 'package:bund/cubit/home_cubit.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/resource/theme_manager.dart';
import 'package:bund/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();
  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance
  factory MyApp() => _instance; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        title: AppStrings.bund,
        initialRoute: AppPages.INITIAL,
        routes: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        darkTheme: getDarkApplicationTheme(),
        builder: EasyLoading.init(),
        scrollBehavior: AppScrollBehavior(),
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
