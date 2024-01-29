import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/constants/end_points.dart';
import '../models/product_response.dart';

class MegaService {
 Future<List<ProductResponse>?>getMegaProducts() async {
    final Uri uri = Uri.parse(EndPoints.megaProducts);
    final Response response = await get(uri);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final result = data.map((e) => ProductResponse.fromJson(e)).toList();
      return result;
    }return null;
  }
}
