import 'package:bund/resource/constant_manager.dart';
import 'package:bund/ui/common/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppConstants.configureLoading();
  runApp(MyApp());
}
