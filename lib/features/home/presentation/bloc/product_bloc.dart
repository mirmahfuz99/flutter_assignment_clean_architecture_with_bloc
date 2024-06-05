import 'package:flutter_assignment/features/home/domain/usecase/get_product.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_event.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final GetProductUseCase _getProductUseCase;

  ProductBloc(this._getProductUseCase): super(const ProductsLoading()){
    on <GetProducts> (onGetProducts);
  }

  void onGetProducts(GetProducts event, Emitter<ProductState> emit) async{
    final products = await _getProductUseCase();

    emit(ProductsLoaded(products));
  }

}