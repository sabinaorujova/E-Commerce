import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page/cubits/review/review_state.dart';
import 'package:login_page/data/services/comment_service.dart';
import 'package:login_page/utils/helpers/service_locator.dart';
import 'package:rxdart/rxdart.dart';

class ReviewCubit extends Cubit<(double, ReviewState?)> {
  ReviewCubit() : super((0, ReviewInitial()));
  final _commentService = getIt.get<CommentService>();
  final BehaviorSubject<List<File>> subjectImage =
      BehaviorSubject<List<File>>();

  Stream<List<File>> get getImageStream => subjectImage.stream;

  final List<File> imageFiles = [];

  void loadImage(File file) {
    imageFiles.add(file);
    subjectImage.add(imageFiles);
  }

  void onRate(double rating) {
    emit((rating, ReviewInitial()));
  }

  void createComment({
    required int parentId,
    required double rating,
    required String comment,
    required String token,
  }) async {
    try {
      emit((0, ReviewLoading()));
      await _commentService.createComment(
          parentId: parentId,
          files: subjectImage.value,
          rating: rating,
          comment: comment,
          token: '');
      emit((0, ReviewSuccess()));
    } catch (e) {
      emit((rating,ReviewError()));
    }
  }

  @override
  Future<void> close() {
    subjectImage.close();
    return super.close();
  }
}
