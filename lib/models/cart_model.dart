import 'package:delivery_ecommerce/models/product_model.dart';

class CartModel {
  int id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel(
      {required this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.isExist,
      this.time,
      this.product
      });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      img: json["img"],
      quantity: json["quantity"],
      isExist: json["isExist"],
      time: json["time"],
      product: ProductModel.fromJson(json["product"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "img": img,
        "quantity": quantity,
        "isExist": isExist,
        "time": time,
        "product": product!.toJson() // WHATS
  };
}
