import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/utils/constants/padding.dart';
import '../../../../utils/helpers/app_localizatoin.dart';
import 'widgets/color_b0x.dart';
import 'widgets/fav_icon_button.dart';
import 'widgets/product_features.dart';
import 'widgets/size_select.dart';
import '../widgets/components/rating_bar.dart';
import '../widgets/components/slider.dart';
import '../widgets/product_items/product_discount.dart';
import '../widgets/product_items/product_name.dart';
import '../widgets/product_items/product_price.dart';
import '../../../../cubits/comment/cubit/comment_cubit.dart';
import '../../../../cubits/detail/product_detail_cubit.dart';
import '../../../../cubits/detail/product_detail_state.dart';
import '../../widgets/global_widgets/global_button.dart';
import '../../widgets/global_widgets/global_loading.dart';

import '../../../../utils/constants/box_sized.dart';

import '../comments/comment_page.dart';
import '../widgets/buttons/title_appbar.dart';
import 'widgets/image.dart';
import 'widgets/product_review.dart';
import 'widgets/review_count.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({
    Key? key,
  }) : super(key: key);
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();

    return Scaffold(
      appBar: TitleAppbar(
        title: AppLocalizations.of(context).productDetailTitle,
        icon: Icons.arrow_back_ios,
        searchicon: Icons.search,
        icon2: Icons.more_vert,
      ),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading || state is ProductDetailInitial) {
            return const GlobalLoading();
          } else if (state is ProductDetailSuccess) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: AppPaddings.a16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDetailImage(
                        controller: pageController,
                      ),
                      8.verticalSpace,
                      MySlider(controller: pageController),
                      16.verticalSpace,
                      ProductTitle(title: cubit.productDetail!.name),
                      8.horizontalSpace,
                      ProductPrice(price: cubit.productDetail!.price),
                      ProductDiscount(
                          disCount: cubit.productDetail!.discountedPrice),
                      const FavIconButton(),
                      ProductRatingBar(
                        rating: cubit.productDetail!.rating!,
                      ),
                      const SizeBox(),
                      const ColorsBox(),
                      ProductFeatures(
                        brand: cubit.productDetail!.brand,
                        category: cubit.productDetail!.category,
                        description:  AppLocalizations.of(context).productDescription,
                      ),
                      16.verticalSpace,
                      const ProductReview(),
                      Row(
                        children: [
                          ProductRatingBar(
                            rating: cubit.productDetail!.rating!
                          ),
                          8.horizontalSpace,
                          ReviewCount(
                            review: cubit.productDetail!.reviewCount,
                          )
                        ],
                      ),
                      AppSizedbox.h24,
                      Button(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => CommentCubit()
                                            ..getComments(
                                                cubit.productDetail!.id),
                                          child: const CommentPage(),
                                        )));
                          },
                          title:AppLocalizations.of(context).addToCartButton),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
