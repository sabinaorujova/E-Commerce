import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'utils/helpers/hive_boxes.dart';
import 'app.dart';

import 'utils/helpers/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await HiveBoxes.init();

  runApp(const MyApp());
}
