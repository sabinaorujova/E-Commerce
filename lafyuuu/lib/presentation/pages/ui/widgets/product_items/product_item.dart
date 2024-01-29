import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cubits/detail/product_detail_cubit.dart';
import '../../../../../data/models/product_response.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/radiuses.dart';
import '../../cart_page/widgets/cart.dart';
import '../../product_detail/product_detail.dart';
import 'product_discount.dart';
import 'product_image.dart';
import 'product_name.dart';
import 'product_price.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });
  final ProductResponse product;

  @override
  Widget build(BuildContext context) {
    void addToCart() {
      Cart.addToCart(product);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(' add to Cart'),
        duration: Duration(seconds: 2),
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) =>
                      ProductDetailCubit()..getProductDetails(product.id),
                  child:  ProductDetail(),
                ),
              ),
            );
          }
        },
        //
        child: Container(
          width: 140.w,
          height: 240.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: AppRadiuses.c5,
            color: AppColors.white,
            border: Border.all(color: AppColors.neutralLight, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(productimageUrl: product.image),
                8.verticalSpace,
                ProductTitle(
                  title: product.name,
                ),
                8.verticalSpace,
                ProductPrice(price: product.price),
                8.verticalSpace,
                ProductDiscount(
                  disCount: product.discountedPrice,
                ),
                ElevatedButton(
                  onPressed: addToCart,
                  child: const Text('Add Cart'),
                ),
                // .
              ],
            ),
          ),
        ),
      ),
    );
  }
}
