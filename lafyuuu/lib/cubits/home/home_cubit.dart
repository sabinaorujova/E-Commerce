import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';
import '../../data/models/category_response.dart';
import '../../data/models/product_response.dart';
import '../../data/services/category_service.dart';
import '../../data/services/flash_service.dart';
import '../../data/services/mega_service.dart';
import '../../data/services/recommed_service.dart';

import '../../utils/helpers/service_locator.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final CategoryService _categoryService = getIt.get<CategoryService>();
  final FlashService _flashService = getIt.get<FlashService>();
  final MegaService _megaService = getIt.get<MegaService>();
  final RecommendedService _recommendedService =
      getIt.get<RecommendedService>();
  List<CategoryResponse>? categories;
  List<ProductResponse>? flashProducts;
  List<ProductResponse>? megaProducts;
  List<ProductResponse>? recommendedProducts;

  Future<void> getdatas() async {
    try {
      emit(HomeLoading());
      final fetchedCategories = await _categoryService.getCatagory();
      final fetchedFlashproducts = await _flashService.getFlashProducts();
      final fetchedMegaProducts = await _megaService.getMegaProducts();
      final fetchedrecommendedProducts =await _recommendedService.getRecommendedProducts();

      categories = fetchedCategories;
      flashProducts = fetchedFlashproducts;
      megaProducts = fetchedMegaProducts;
      recommendedProducts = fetchedrecommendedProducts;
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeError());
    }
  }
}
