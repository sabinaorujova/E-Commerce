import 'dart:convert';

import 'package:http/http.dart';
import '../models/category_response.dart';
import '../../utils/constants/end_points.dart';

class CategoryService {
  Future<List<CategoryResponse>> getCatagory() async {
    final Uri uri = Uri.parse(EndPoints.categories);
    final Response response = await get(uri);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final result = data.map((e) => CategoryResponse.fromJson(e)).toList();
      return result;
    }
    throw Exception('Error');
  }
}
