class CommentModel {
  final int id;
  final User user;
  final List<CommentImage> commentImages;
  final double rating;
  final String comment;
  final DateTime date;

  CommentModel({
    required this.id,
    required this.user,
    required this.commentImages,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        user: User.fromJson(json["user"]),
        commentImages: List<CommentImage>.from(
            json["comment_images"].map((x) => CommentImage.fromJson(x))),
        rating: json["rating"].toDouble(),
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "comment_images":
            List<dynamic>.from(commentImages.map((x) => x.toJson())),
        "rating": rating,
        "comment": comment,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

class CommentImage {
  final int id;
  final String image;

  CommentImage({
    required this.id,
    required this.image,
  });

  factory CommentImage.fromJson(Map<String, dynamic> json) => CommentImage(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class User {
  final int id;
  final String fullName;
  final String email;

  User({
    required this.id,
    required this.fullName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
      };
}
