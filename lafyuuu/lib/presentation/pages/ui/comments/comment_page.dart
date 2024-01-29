import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/utils/constants/padding.dart';
import '../../../../cubits/comment/cubit/comment_cubit.dart';
import '../../../../cubits/review/review_cubit.dart';
import 'widgets/list_tile_comments.dart';
import '../reviews_page/review_page.dart';
import '../widgets/buttons/title_appbar.dart';
import '../../../../utils/constants/app_text.dart';
import '../../widgets/global_widgets/global_button.dart';
import '../../widgets/global_widgets/global_loading.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CommentCubit>();
    return Scaffold(
        appBar: const TitleAppbar(title: 'Comments'),
        body:
            BlocBuilder<CommentCubit, CommentState>(builder: (context, state) {
          if (state is CommentLoading || state is CommentInitial) {
            return const GlobalLoading();
          } else if (state is CommentSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: AppPaddings.a8,
                child: Column(
                  children: [
                    ListView.separated(
                      separatorBuilder: (context, index) => 8.verticalSpace,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.fetchedCommentList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final comment = cubit.fetchedCommentList![index];

                        return ListTileComments(comment: comment);
                      },
                    ),
                    8.verticalSpace,
                    Button(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>BlocProvider(
                                        create: (context) => ReviewCubit(),
                                     
                                        child:Builder(builder: (context)=>const ReviewPage(),
                                      ))));
                        },
                        title: AppTexts.writeReview)
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }));
  }
}
