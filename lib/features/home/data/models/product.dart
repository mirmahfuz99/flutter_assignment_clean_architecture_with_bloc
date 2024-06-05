import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {

  const factory Product({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'date_created') String? dataCreated,
    @JsonKey(name: 'price') String? price,
    @JsonKey(name: 'regular_price') String? regularPrice,
    @JsonKey(name: 'sale_price') String? salePrice,
    @JsonKey(name: 'total_sales') int? totalSales,
    @JsonKey(name: 'rating_count') int? ratingCount,
    @JsonKey(name: 'images') List<Images>? images,

  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}


@freezed
class Images with _$Images {
  const factory Images({
    @JsonKey(name: 'id') int? lastUpdated,
    @JsonKey(name: 'src') String? src,
    @JsonKey(name: 'name') String? name,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) =>
      _$ImagesFromJson(json);
}