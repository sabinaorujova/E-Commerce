import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/models/comments_model.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/padding.dart';
import '../../../../../utils/constants/radiuses.dart';

class FetchCommentImage extends StatelessWidget {
  const FetchCommentImage({super.key, required this.comment});
  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        comment.commentImages.length,
        (index) => Container(
          height: 72.r,
          width: 72.r,
          margin: AppPaddings.r16,
          decoration: BoxDecoration(
            color: AppColors.neutralLight,
            borderRadius: AppRadiuses.c5,
            image: DecorationImage(
              image: NetworkImage(comment.commentImages[index].image),
            ),
          ),
        ),
      ),
    );
  }
}
