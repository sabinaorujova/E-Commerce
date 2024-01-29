import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reply extends StatelessWidget {
  const Reply({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
            const Icon(Icons.reply),
            Text(
              'REPLY',
              style: TextStyle(
                fontSize: 9.0.sp,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
