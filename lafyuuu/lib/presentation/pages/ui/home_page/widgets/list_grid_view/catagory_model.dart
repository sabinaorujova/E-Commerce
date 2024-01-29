class CategoryModel {
  final String title;
  final String imagePath;

  CategoryModel({required this.title, required this.imagePath});

  static List<CategoryModel> category = [
    CategoryModel(
      title: 'Man Shirt',
      imagePath: 'images/png/shirt.png',
    ),
    CategoryModel(
      title: 'Dress',
      imagePath: 'images/png/dress.png',
    ),
    CategoryModel(
      title: 'Man Work Equipment',
      imagePath: 'images/png/manBag.png',
    ),
    CategoryModel(
      title: 'Woman Bag',
      imagePath: 'images/png/womanBag.png',
    ),
    CategoryModel(
      title: 'Woman Pants',
      imagePath: 'images/png/womanPants.png',
    ),
    CategoryModel(
      title: 'Woman Shoes',
      imagePath: 'images/png/womanShoes.png',
    ),
  ];
}
