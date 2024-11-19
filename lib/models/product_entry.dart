// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String model;
    String pk;
    Fields fields;

    ProductEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    String imageUrl;
    DateTime time;
    int price;
    String description;
    int quantity;

    Fields({
        required this.user,
        required this.name,
        required this.imageUrl,
        required this.time,
        required this.price,
        required this.description,
        required this.quantity,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        imageUrl: json["image_url"],
        time: DateTime.parse(json["time"]),
        price: json["price"],
        description: json["description"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "image_url": imageUrl,
        "time": "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "price": price,
        "description": description,
        "quantity": quantity,
    };
}