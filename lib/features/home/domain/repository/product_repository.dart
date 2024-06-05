import 'package:flutter_assignment/features/home/data/models/product.dart';

abstract class ProductRepository {
  // API methods
  Future<List<Product>> getProducts();

}