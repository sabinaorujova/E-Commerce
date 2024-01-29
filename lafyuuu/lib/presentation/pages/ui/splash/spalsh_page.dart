import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/register/register_cubit.dart';
import '../../../../utils/helpers/navigate.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/radiuses.dart';
import '../../auth/register/register_page.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}
  late Timer _timer;

class _SpalshPageState extends State<SpalshPage> {
  @override
  void initState() {
    super.initState();
    _timer=Timer(
        const Duration(seconds: 3),
        () => Navigate.replace(
            context,
            BlocProvider(
                create: (context) => RegisterCubit(),
                child: const RegisterPage())));
  }
  @override
void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
      body: Center(
        child: Container(
          height: 72.r,
          width: 72.r,
          decoration: const BoxDecoration(
              color: AppColors.white, borderRadius: AppRadiuses.a216),
          child: Image.asset(
            'images/png/splash.png',
            height: 16.h,
            width: 16.w,
          ),
        ),
      ),
    );
  }
}
