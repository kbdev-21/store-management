import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_management/models/product.dart';

class ProductRepo {
  final _db = FirebaseFirestore.instance;

  Future<DocumentReference> createProduct({required Product product}) async {
    final CollectionReference productRef = _db.collection('products');
    try {
      return await productRef.add(product.toFirestore());
    } catch (e) {
      throw Exception('Failed to create product: ${e.toString()}');
    }
  }

  Future<List<Product>> getAllProducts() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _db.collection('products').get();
      if (querySnapshot.docs.isEmpty) {
        return [];
      }

      final List<Product> products =
          querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();

      return products;
    } catch (e) {
      throw Exception('Failed to get all topics: ${e.toString()}');
    }
  }

  Future<Product?> getProductById(String productId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await _db.collection('products').doc(productId).get();

       if (!docSnapshot.exists) {
        return null;
      }

      final product = Product.fromFirestore(docSnapshot);

      return product;
    } catch (e) {
      throw Exception('Failed to get topic: ${e.toString()}');
    }
  }
}
