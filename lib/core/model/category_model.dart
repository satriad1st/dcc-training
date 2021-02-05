import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) => json.encode(data.toJson());

class CategoryResponse {
    CategoryResponse({
        this.category,
        this.totalCategory,
    });

    List<Category> category;
    int totalCategory;

    factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
        totalCategory: json["totalCategory"],
    );

    Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "totalCategory": totalCategory,
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}