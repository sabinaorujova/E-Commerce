import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/home/home_cubit.dart';
import '../../../../cubits/home/home_state.dart';
import '../../widgets/global_widgets/global_loading.dart';
import '../../../../utils/constants/padding.dart';
import '../widgets/buttons/search_button.dart';
import '../widgets/components/bottom_navi_bar.dart';
import '../widgets/components/slider.dart';
import 'widgets/images/promotion_image_flash.dart';
import 'widgets/images/promotion_recommend.dart';
import 'widgets/list_grid_view/grid_view_products.dart';
import 'widgets/list_grid_view/list_view_flash_products.dart';
import 'widgets/list_grid_view/list_view_mega_sale.dart';
import 'widgets/list_grid_view/my_category.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbark(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const GlobalLoading();
          } else if (state is HomeSuccess) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: AppPaddings.a16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      16.verticalSpace,
                      const PromotionImageFlash(),
                      16.verticalSpace,
                      MySlider(controller: pageController),
                      16.verticalSpace,
                      const MyCategory(),
                      16.verticalSpace,
                      const ListViewFlashProducts(),
                      24.verticalSpace,
                      const ListViewMegaSale(),
                      16.verticalSpace,
                      const PromotionRecommend(),
                      16.verticalSpace,
                      const GridViewProducts(),
                      16.verticalSpace,
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
