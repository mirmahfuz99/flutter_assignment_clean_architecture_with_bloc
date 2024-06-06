import 'package:flutter_assignment/features/home/data/models/product.dart';
import 'package:flutter_assignment/features/home/domain/usecase/get_product.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_event.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUseCase _getProductUseCase;
  List<Product> _allProducts = [];
  FilterCriteria _currentCriteria = FilterCriteria.newest;

  ProductBloc(this._getProductUseCase) : super(const ProductsLoading()) {
    on<GetProducts>(onGetProducts);
    on<UpdateFilterCriteria>(onUpdateFilterCriteria);
  }

  void onGetProducts(GetProducts event, Emitter<ProductState> emit) async {
    emit(const ProductsLoading());
    final products = await _getProductUseCase();
    _allProducts = products;
    _filterAndEmitProducts(emit);
  }

  void onUpdateFilterCriteria(UpdateFilterCriteria event, Emitter<ProductState> emit) {
    _currentCriteria = event.criteria;
    _filterAndEmitProducts(emit);
  }

  void _filterAndEmitProducts(Emitter<ProductState> emit) {
    List<Product> filteredProducts = List.from(_allProducts);
    switch (_currentCriteria) {
      case FilterCriteria.newest:
        filteredProducts.sort((a, b) => b.dataCreated!.compareTo(a.dataCreated!));
        break;
      case FilterCriteria.oldest:
        filteredProducts.sort((a, b) => a.dataCreated!.compareTo(b.dataCreated!));
        break;
      case FilterCriteria.priceLow:
        filteredProducts.sort((a, b) => double.parse(a.price!).compareTo(double.parse(b.price!)));
        break;
      case FilterCriteria.priceHigh:
        filteredProducts.sort((a, b) => double.parse(b.price!).compareTo(double.parse(a.price!)));
        break;
      case FilterCriteria.bestSelling:
        filteredProducts.sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
        break;
    }

    emit(ProductsLoaded(filteredProducts, criteria: _currentCriteria));
  }
}
