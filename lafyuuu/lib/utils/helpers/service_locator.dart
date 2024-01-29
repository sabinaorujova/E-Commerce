import 'package:get_it/get_it.dart';

import '../../data/services/category_service.dart';
import '../../data/services/comment_service.dart';
import '../../data/services/flash_service.dart';
import '../../data/services/login_service.dart';
import '../../data/services/mega_service.dart';
import '../../data/services/product_detail.dart';
import '../../data/services/recommed_service.dart';
import '../../data/services/register_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton(() => RegisterService());
  getIt.registerLazySingleton(() => LoginService());
    getIt.registerLazySingleton(() => CategoryService());
    getIt.registerLazySingleton(() => FlashService());
    getIt.registerLazySingleton(() => MegaService());
    getIt.registerLazySingleton(() => RecommendedService());
    getIt.registerLazySingleton(() => ProductDetailService());
      getIt.registerLazySingleton(() =>CommentService());

}
