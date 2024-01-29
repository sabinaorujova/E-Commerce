import 'dart:convert';
import 'package:http/http.dart';
import '../models/product_details.dart';
import '../../utils/constants/end_points.dart';

class ProductDetailService {
  Future<ProductDetailResponse> getProductDetail( int id) async {
    final Uri uri = Uri.parse('${EndPoints.productDetail}/$id');
    final Response response = await get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final ProductDetailResponse productDetail =
          ProductDetailResponse.fromJson(data);

      return productDetail;
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
