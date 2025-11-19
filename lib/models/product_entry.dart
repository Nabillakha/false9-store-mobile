// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    String description;
    String category;
    String thumbnail;
    int stock;
    int sold;
    int price;
    int view;
    bool isFeatured;
    int userId;
    String user_username;
    String category_display;

    ProductEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.stock,
        required this.sold,
        required this.price,
        required this.view,
        required this.isFeatured,
        required this.userId,
        required this.user_username,
        required this.category_display,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        stock: json["stock"],
        sold: json["sold"],
        price: json["price"],
        view: json["view"],
        isFeatured: json["is_featured"],
        userId: json["user_id"],
        user_username: json["user_username"],
        category_display: json["category_display"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "stock": stock,
        "sold": sold,
        "price": price,
        "view": view,
        "is_featured": isFeatured,
        "user_id": userId,
        "user_username": user_username,
        "category_display": category_display,
    };
}
