import 'dart:convert';

import 'package:first_project/core/model/category_model.dart';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
    ProductResponse({
        this.product,
        this.totalProduct,
        this.totalPages,
        this.totalAllProduct,
        this.currentPage,
        this.limit,
    });

    List<Product> product;
    int totalProduct;
    int totalPages;
    int totalAllProduct;
    int currentPage;
    int limit;

    factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
        totalProduct: json["totalProduct"],
        totalPages: json["totalPages"],
        totalAllProduct: json["totalAllProduct"],
        currentPage: json["currentPage"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
        "totalProduct": totalProduct,
        "totalPages": totalPages,
        "totalAllProduct": totalAllProduct,
        "currentPage": currentPage,
        "limit": limit,
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
        stock: json["stock"],
        sellPrice: json["sellPrice"],
        description: json["description"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        isDeleted: json["isDeleted"],
        id: json["_id"],
        name: json["name"],
        merkProduct: json["merkProduct"],
        buyPrice: json["buyPrice"],
        category: Category.fromJson(json["category"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
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