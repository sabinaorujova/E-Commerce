import '../../../../../data/models/product_response.dart';

class Cart {
  static List<ProductResponse> products = [];

  static void addToCart(ProductResponse product) {
    products.add(product);
  }

  static void removeFromCart(ProductResponse product) {
    products.remove(product);
  }

  static void clearCart() {
    products.clear();
  }
}
