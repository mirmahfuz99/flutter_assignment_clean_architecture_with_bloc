import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/home/data/models/product.dart';

abstract class ProductState extends Equatable {
  final List<Product> ? products;

  const ProductState({this.products});

  @override
  List<Object> get props => [products!];
}

class ProductsLoading extends ProductState {
  const ProductsLoading();
}

class ProductsLoaded extends ProductState {
  const ProductsLoaded(List<Product> products) : super(products: products);
}