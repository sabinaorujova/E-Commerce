class EndPoints {
  EndPoints._();

  static const String _liveBaseUrl = 'http://164.92.128.223:8000';
  static const String _products = '$_liveBaseUrl/products';
  static const _users = '$_liveBaseUrl/users';
//auth
  static const registerLive = '$_users/register';
  static const loginLive = '$_users/login';
//UI
  static const categories = '$_products/categories';
  static const flashProducts = '$_products/flash';
  static const megaProducts = '$_products/mega';
  static const recommendedProducts = '$_products/recommended';
  static const productDetail = '$_products/detail';
  static const comments = '$_products/comment';
 



}
