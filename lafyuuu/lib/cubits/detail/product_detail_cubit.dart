import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_details.dart';
import '../../data/services/product_detail.dart';
import '../../utils/helpers/service_locator.dart';
import 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
ProductDetailCubit() : super(ProductDetailInitial());
final ProductDetailService _detailService = getIt.get<ProductDetailService>();
  ProductDetailResponse? productDetail;

  Future<void> getProductDetails(int id) async {
    try {
      emit(ProductDetailLoading());

      final fetchedProductDetail = await _detailService.getProductDetail(id);
      productDetail = fetchedProductDetail;

      emit(ProductDetailSuccess());
    } catch (e) {
      emit(ProductDetailError()); 
    }
  }
}
