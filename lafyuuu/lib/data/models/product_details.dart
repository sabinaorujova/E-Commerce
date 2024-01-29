

class ProductDetailResponse {
    final int id;
    final int parentId;
    final String name;
    final String brand;
    final String category;
    final String description;
    final int stock;
    final String price;
    final int discount;
    final double discountedPrice;
    final int color;
    final int size;
    final double? rating;
    final int reviewCount;
    final List<Available> availableSizes;
    final List<Available> availableColors;
 final List<ProductImages> images;
    ProductDetailResponse({
        required this.id,
        required this.parentId,
        required this.name,
        required this.brand,
        required this.category,
        required this.description,
        required this.stock,
        required this.price,
        required this.discount,
        required this.discountedPrice,
        required this.color,
        required this.size,
        required this.rating,
        required this.reviewCount,
        required this.availableSizes,
        required this.availableColors,
        required this.images,
    });

    factory ProductDetailResponse.fromJson(Map<String, dynamic> json) => ProductDetailResponse(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        brand: json["brand"],
        category: json["category"],
        description: json["description"],
        stock: json["stock"],
        price: json["price"],
        discount: json["discount"],
        discountedPrice: json["discounted_price"],
        color: json["color"],
        size: json["size"],
        rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
        reviewCount: json["review_count"],
        availableSizes: List<Available>.from(json["available_sizes"].map((x) => Available.fromJson(x))),
        availableColors: List<Available>.from(json["available_colors"].map((x) => Available.fromJson(x))),
      images: List<ProductImages>.from(json["images"].map((x) => ProductImages.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "brand": brand,
        "category": category,
        "description": description,
        "stock": stock,
        "price": price,
        "discount": discount,
        "discounted_price": discountedPrice,
        "color": color,
        "size": size,
        "rating": rating,
        "review_count": reviewCount,
        "available_sizes": List<dynamic>.from(availableSizes.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}

class Available {
    final int id;
    final String name;

    Available({
        required this.id,
        required this.name,
    });

    factory Available.fromJson(Map<String, dynamic> json) => Available(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class ProductImages {
    final int id;
    final String image;

    ProductImages({
        required this.id,
        required this.image,
    });

    factory ProductImages.fromJson(Map<String, dynamic> json) => ProductImages(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}
