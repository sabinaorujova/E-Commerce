import 'package:flutter/material.dart';

import '../../../../data/models/product_response.dart';
import '../../../../utils/constants/app_colors.dart';
import '../widgets/buttons/title_appbar.dart';
import '../widgets/product_items/product_image.dart';
import '../widgets/product_items/product_name.dart';
import '../widgets/product_items/product_price.dart';
import 'widgets/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, this.cartItems}) : super(key: key);
  final List<String>? cartItems;

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductResponse> cartProducts = Cart.products;

  void removeFromCart(ProductResponse product) {
    setState(() {
      cartProducts.remove(product);
      Cart.removeFromCart(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} removed from cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    getCartItemCount() {
      return cartProducts.length;
    }

    return Scaffold(
      appBar: const TitleAppbar(
        title: 'Your Cart',
        icon: Icons.arrow_back_ios,
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          ProductResponse product = cartProducts[index];
          return Dismissible(
            key: Key(product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              removeFromCart(product);
            },
            background: Container(
              alignment: Alignment.centerRight,
              color: AppColors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: ProductTitle(title: product.name),
              subtitle: ProductPrice(price: product.price),
              leading: ProductImage(productimageUrl: product.image),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {
                  removeFromCart(product);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
