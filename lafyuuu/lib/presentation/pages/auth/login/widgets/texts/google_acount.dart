import 'package:flutter/material.dart';
import '../../../../../../utils/constants/app_text.dart';
import '../../../widgets/account_request.dart';

class GoogleAcountRequest extends StatelessWidget {
  const GoogleAcountRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountRequest(
      image: 'images/png/google.png',
      title: AppTexts.googleText,
    );
  }
}
