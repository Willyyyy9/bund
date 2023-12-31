import 'package:bund/resource/constant_manager.dart';
import 'package:bund/resource/string_manager.dart';
import 'package:bund/ui/common/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<Box> openHiveBox(String boxName) async {
  if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return await Hive.openBox(boxName);
}

initObjects() async {
  GetIt.I
      .registerLazySingleton<Box>(() => Hive.box(AppStrings.settingsHiveBox));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConstants.configureLoading();
  await openHiveBox(AppStrings.settingsHiveBox);
  await initObjects();
  runApp(MyApp());
}
