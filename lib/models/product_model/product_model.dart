import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.isFavorite,
    this.qty,
  });

  String id;
  String image;
  String name;
  String price;
  String description;
  String status;
  bool isFavorite;

  int? qty;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        status: json["status"],
        isFavorite: false,
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "description": description,
        "status": status,
        "isFavorite": isFavorite,
        "qty": qty,
      };

  // @override
  ProductModel copyWith({
    int? qty,
  }) =>
      ProductModel(
        id: id,
        image: image,
        name: name,
        price: price,
        description: description,
        status: status,
        isFavorite: isFavorite,
        qty: qty ?? this.qty,
      );
}
