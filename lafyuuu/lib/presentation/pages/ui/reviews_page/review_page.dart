import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_page/cubits/review/review_state.dart';
import 'package:login_page/presentation/pages/ui/comments/comment_page.dart';
import '../../../../cubits/review/review_cubit.dart';
import '../../widgets/global_widgets/global_button.dart';
import '../../widgets/global_widgets/global_input.dart';
import '../../widgets/global_widgets/my_text.dart';
import '../widgets/buttons/title_appbar.dart';
import '../widgets/components/rating_bar.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_text.dart';
import '../../../../utils/constants/padding.dart';
import '../../../../utils/constants/radiuses.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReviewCubit cubit = context.read<ReviewCubit>();
    return Scaffold(
      appBar: const TitleAppbar(title: AppTexts.writeReview),
      body: Padding(
        padding: AppPaddings.a16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('jksjjsdh'),
            8.verticalSpace,
            BlocBuilder<ReviewCubit, (double, ReviewState?)>(
              builder: (context, state) {
                return Row(
                  children: [
                    ProductRatingBar(
                      rating: state.$1,
                      starSize: 30.sp,
                      onRating: (rating) {
                        cubit.onRate(rating);
                      },
                    ),
                    8.horizontalSpace,
                    Text(
                      '${state.$1}',
                      style: GoogleFonts.poppins(
                          color: AppColors.neutralDark, fontSize: 16),
                    ),
                  ],
                );
              },
            ),
            8.verticalSpace,
            const MyText(title: AppTexts.writeReview),
            8.verticalSpace,
            const GlobalInput(
              hintText: AppTexts.writeReview,
              maxLine: 5,
            ),
            8.verticalSpace,
            const MyText(title: AppTexts.adPhoto),
            8.verticalSpace,
            SizedBox(
              height: 72.r,
              child: Wrap(
                spacing: 12,
                runSpacing: 10,
                children: [
                  InkWell(
                    onTap: () async {
                      XFile? xFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      cubit.loadImage(File(xFile!.path));
                    },
                    child: Ink(
                      width: 72.r,
                      height: 72.r,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: AppRadiuses.c5,
                          border: Border.all(color: AppColors.grey),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 2,
                                spreadRadius: -1)
                          ]),
                      child: const Icon(Icons.add),
                    ),
                  ),
                  for (int i = 0; i < 3; i++)
                    StreamBuilder(
                      stream: cubit.getImageStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.data == null) {
                          return const SizedBox.shrink();
                        }
                        final List<File> images = snapshot.data!;
                        return Wrap(
                            children: images
                                .map(
                                  (image) => Container(
                                    height: 72.r,
                                    width: 72.r,
                                    decoration: BoxDecoration(
                                      color: AppColors.neutralLight,
                                      borderRadius: AppRadiuses.c5,
                                      image: DecorationImage(
                                        image: FileImage(image),
                                      ),
                                    ),
                                  ),
                                )
                                .toList());
                      },
                    )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<ReviewCubit, (double, ReviewState?)>(
          listener: (context, state) {
            if (state.$2 is ReviewSuccess) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const CommentPage()));
            }
          },
          builder: (context, state) {
            return Button(
              title: 'Send Comment',
              onTap: () => cubit.createComment(
                  parentId: 1, rating: 3, comment: 'jgcj', token: ''),
            );
          },
        ),
      ),
    );
  }
}
