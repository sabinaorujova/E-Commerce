import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/models/comments_model.dart';

import '../../widgets/components/rating_bar.dart';
import 'comment_image.dart';
import 'reply.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;

  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductRatingBar(
          rating: comment.rating,
        ),
        8.verticalSpace,
        Text(comment.comment),
        8.verticalSpace,
        Text('${comment.date}'),
        8.verticalSpace,
        FetchCommentImage(comment: comment),
        8.verticalSpace,
        const Reply()
      ],
    );
  }
}
