import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/padding.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Duration duration;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    duration = const Duration(hours: 8);
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void subtractTime(Timer timer) {
    setState(() {
      if (duration.inSeconds > 0) {
        final seconds = duration.inSeconds - 1;
        duration = Duration(seconds: seconds);
      } else {
        timer.cancel();
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), subtractTime);
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildTimeCard(time: hours),
        buildTimeSeparator(),
        buildTimeCard(time: minutes),
        buildTimeSeparator(),
        buildTimeCard(time: seconds),
      ],
    );
  }

  Widget buildTimeCard({required String time}) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding:AppPaddings.a8,
        child: Text(
          time,
          style: GoogleFonts.poppins(
              fontSize: 16.sp,
              color: AppColors.neutralDark,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget buildTimeSeparator() {
    return Padding(
      padding:AppPaddings.a8,
      child: Text(
        ':',
        style: GoogleFonts.poppins(
            fontSize: 14.sp, color: AppColors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
