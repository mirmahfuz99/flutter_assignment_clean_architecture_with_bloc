import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/home/data/models/product.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_event.dart';

abstract class ProductState extends Equatable {
  final List<Product> ? products;
  final FilterCriteria? criteria;


  const ProductState({this.products, this.criteria});

  @override
  List<Object> get props => [products!, criteria ?? FilterCriteria.newest];
}

class ProductsLoading extends ProductState {
  const ProductsLoading();
}

class ProductsLoaded extends ProductState {
  const ProductsLoaded(List<Product> products, {FilterCriteria criteria = FilterCriteria.newest})
      : super(products: products, criteria: criteria);
}