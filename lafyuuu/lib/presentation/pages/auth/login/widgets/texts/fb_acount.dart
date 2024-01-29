import 'package:flutter/material.dart';
import '../../../../../../utils/constants/app_text.dart';
import '../../../widgets/account_request.dart';

class FbAcountRequest extends StatelessWidget {
  const FbAcountRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return const  AccountRequest(
      image: 'images/png/fb.png',
      title: AppTexts.fbText,
    );
  }
}
