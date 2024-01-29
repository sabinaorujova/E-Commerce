import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_text.dart';
import '../../../widgets/title_text._icon.dart';

class RegisterLogo extends StatelessWidget {
  const RegisterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const  TitleTextIcon(
      title: AppTexts.registertitle,
      subTitle: AppTexts.registersubtitle,
    );
  }
}
