import 'package:flutter_assignment/core/usecase/usecase.dart';
import 'package:flutter_assignment/features/home/data/models/product.dart';
import 'package:flutter_assignment/features/home/domain/repository/product_repository.dart';

class GetProductUseCase implements UseCase<List<Product>,void>  {

  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  @override
  Future<List<Product>> call({params}) {
    return _productRepository.getProducts();
  }

}