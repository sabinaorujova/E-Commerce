import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/models/comments_model.dart';
import 'comment_item.dart';

class ListTileComments extends StatelessWidget {
  const ListTileComments({super.key, required this.comment});
  final CommentModel comment;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png',
              ),
            ),
            title: SizedBox(
              width: 300.w,
              height: 40.h,
              child: Text('${comment.user.fullName}'),
            ),
            subtitle: CommentItem(comment: comment)));
  }
}
