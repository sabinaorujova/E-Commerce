import 'dart:convert';

import 'package:http/http.dart';
import '../models/product_response.dart';
import '../../utils/constants/end_points.dart';

class RecommendedService {
  Future<List<ProductResponse>?> getRecommendedProducts() async {
    final Uri uri = Uri.parse(EndPoints.recommendedProducts);
    final Response response = await get(uri);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final products = data.map((e) => ProductResponse.fromJson(e)).toList();
      return products;
    }
    return [];
  }
}
