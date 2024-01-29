import 'package:flutter/material.dart';
import '../../../../../../utils/constants/app_text.dart';
import '../../../widgets/title_text._icon.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitleTextIcon(
      title: AppTexts.logintitle,
      subTitle: AppTexts.signContinue,
      
    );
  }
}
