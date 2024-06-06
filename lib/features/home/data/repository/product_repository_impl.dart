import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/features/home/data/models/product.dart';
import 'package:flutter_assignment/features/home/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {

  @override
  Future<List<Product>> getProducts() async {
    List<Product> _productList = [];

    print("inside_get_products");
    String jsonString = await rootBundle.loadString('assets/response.json');
    jsonDecode(jsonString).forEach((product){
      _productList.add(Product.fromJson(product));
    });
    return _productList;
  }

}