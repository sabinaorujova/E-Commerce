import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'utils/helpers/app_localizatoin.dart';
import 'cubits/home/home_cubit.dart';
import 'utils/constants/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/pages/ui/home_page/home_page.dart';
import 'presentation/pages/ui/splash/spalsh_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    checkFirstTime();
  }

  Future<void> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('isFirstTime') ?? true;
    setState(() {
      isFirstTime = firstTime;
    });

    if (firstTime) {
      await prefs.setBool('isFirstTime', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return MaterialApp(
          localizationsDelegates:const [
            AppLocalizations.delegate,
          
          ],
          supportedLocales:const [
             Locale('en', ''), 
             Locale('az', ''),
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
          title: 'Lafyuu ',
          home: isFirstTime ? const SpalshPage() : BlocProvider(
            create: (context) => HomeCubit()..getdatas(),
            child:  HomePage(),
          ),
        );
      },
    );
  }
}
