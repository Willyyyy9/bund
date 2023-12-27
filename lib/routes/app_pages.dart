// ignore_for_file: constant_identifier_names

import 'package:bund/ui/home/home_screen.dart';
import 'package:bund/ui/income/income_screen.dart';
import 'package:flutter/material.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static Map<String, WidgetBuilder> get routes {
    return {
      Routes.HOME: (context) => const HomeScreen(),
      Routes.INCOME: (context) => const IncomeScreen(),
    };
  }
}
