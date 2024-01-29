class CategoryResponse {
  final int id;
  final String name;

  CategoryResponse({
    required this.id,
    required this.name,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
