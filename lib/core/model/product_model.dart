import 'dart:convert';

import 'package:first_project/core/model/category_model.dart';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
    ProductResponse({
        this.product,
    });

    List<Product> product;

    factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        product: json["product"] != null ? List<Product>.from(json["product"].map((x) => Product.fromJson(x))) : [],
    );

    Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.stock,
        this.sellPrice,
        this.description,
        this.images,
        this.isDeleted,
        this.id,
        this.name,
        this.merkProduct,
        this.buyPrice,
        this.category,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    int stock;
    int sellPrice;
    String description;
    List<dynamic> images;
    bool isDeleted;
    String id;
    String name;
    String merkProduct;
    int buyPrice;
    Category category;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        stock: json["stock"] ?? 0,
        sellPrice: json["sellPrice"] ?? 0,
        description: json["description"] ?? "",
        images: json["images"] != null ? List<dynamic>.from(json["images"].map((x) => x)) : [],
        isDeleted: json["isDeleted"] ?? false,
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        merkProduct: json["merkProduct"] ?? "",
        buyPrice: json["buyPrice"] ?? 0,
        category: json["category"] != null ? Category.fromJson(json["category"]) : null,
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "stock": stock,
        "sellPrice": sellPrice,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "isDeleted": isDeleted,
        "_id": id,
        "name": name,
        "merkProduct": merkProduct,
        "buyPrice": buyPrice,
        "category": category.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}