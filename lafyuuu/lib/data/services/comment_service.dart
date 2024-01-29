import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import '../models/comments_model.dart';
import '../../utils/constants/end_points.dart';

class CommentService {
  Future<List<CommentModel>?> getComments(int id) async {
    final Uri uri = Uri.parse('${EndPoints.comments}/$id');
    final Response response = await get(uri);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final comments = data.map((e) => CommentModel.fromJson(e)).toList();
      return comments;
    }
    return null;
  }

  Future<bool> createComment(
      {required int parentId,
      required List<File> files,
      required double rating,
      required String comment,
      required String token}) async {
    final Uri uri = Uri.parse(EndPoints.comments);
    // final Response response = await post(
    //   uri,
    // );
    // if (response.statusCode == HttpStatus.created) {
    //   return true;
    // }
    // throw Exception();
    var request = MultipartRequest("POST", uri);
    request.headers['Authorization'] = 'Token $token ';
    request.fields['product'] = '$parentId';
    request.fields['rating'] = '$rating';
    request.fields['comment'] = comment;

    for (var file in files) {
      request.files.add(await MultipartFile.fromPath(
        'upload_images',
        file.path,
      ));
    }
    final response = await request.send();
    if (response.statusCode == HttpStatus.created) {
      return true;
    }throw Exception();
  }
}
