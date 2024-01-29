import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/comments_model.dart';
import '../../../data/services/comment_service.dart';

import '../../../utils/helpers/service_locator.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());
  final CommentService _service = getIt.get<CommentService>();
  List<CommentModel>? fetchedCommentList; 

  Future<void> getComments(int id) async {
    try {
      emit(CommentLoading());

      final fetchedComment = await _service.getComments(id);
      fetchedCommentList = fetchedComment; 
      emit(CommentSuccess());
    } catch (_) {
      emit(CommentError());
    }
  }
}


