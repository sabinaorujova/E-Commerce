import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/constants/end_points.dart';
import '../models/product_response.dart';

class FlashService {
  Future<List<ProductResponse>?> getFlashProducts() async {
    final Uri uri = Uri.parse(EndPoints.flashProducts);
    final Response response = await get(uri);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final products = data.map((e) => ProductResponse.fromJson(e)).toList();
      return products;
    }
    return [];
  }
}
