import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_management/common/enums.dart';

class Product {
  String? id;
  String? name;
  String? description;
  String? category;
  int? price;
  int? quantity;
  String? imgUrl;
  int? sold;
  bool? isActive;

  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.quantity,
    this.imgUrl,
    this.sold,
    this.isActive
  });

  factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    return Product(
      id: snapshot.id,
      name: data?['name'],
      description: data?['description'],
      category: data?['category'],
      price: data?['price'],
      quantity: data?['quantity'],
      imgUrl: data?['imgUrl'],
      sold: data?['sold'],
      isActive: data?['isActive'],
    );
  }

  // Convert a Product object to a Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'quantity': quantity,
      'imgUrl': imgUrl,
      'sold': sold,
      'isActive': isActive
    };
  }

}