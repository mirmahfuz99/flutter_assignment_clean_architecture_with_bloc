// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_created')
  String? get dataCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'regular_price')
  String? get regularPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_price')
  String? get salePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sales')
  int? get totalSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_count')
  int? get ratingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<Images>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'date_created') String? dataCreated,
      @JsonKey(name: 'price') String? price,
      @JsonKey(name: 'regular_price') String? regularPrice,
      @JsonKey(name: 'sale_price') String? salePrice,
      @JsonKey(name: 'total_sales') int? totalSales,
      @JsonKey(name: 'rating_count') int? ratingCount,
      @JsonKey(name: 'images') List<Images>? images});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dataCreated = freezed,
    Object? price = freezed,
    Object? regularPrice = freezed,
    Object? salePrice = freezed,
    Object? totalSales = freezed,
    Object? ratingCount = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dataCreated: freezed == dataCreated
          ? _value.dataCreated
          : dataCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      regularPrice: freezed == regularPrice
          ? _value.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSales: freezed == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingCount: freezed == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'date_created') String? dataCreated,
      @JsonKey(name: 'price') String? price,
      @JsonKey(name: 'regular_price') String? regularPrice,
      @JsonKey(name: 'sale_price') String? salePrice,
      @JsonKey(name: 'total_sales') int? totalSales,
      @JsonKey(name: 'rating_count') int? ratingCount,
      @JsonKey(name: 'images') List<Images>? images});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dataCreated = freezed,
    Object? price = freezed,
    Object? regularPrice = freezed,
    Object? salePrice = freezed,
    Object? totalSales = freezed,
    Object? ratingCount = freezed,
    Object? images = freezed,
  }) {
    return _then(_$ProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dataCreated: freezed == dataCreated
          ? _value.dataCreated
          : dataCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      regularPrice: freezed == regularPrice
          ? _value.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSales: freezed == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingCount: freezed == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'date_created') this.dataCreated,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'regular_price') this.regularPrice,
      @JsonKey(name: 'sale_price') this.salePrice,
      @JsonKey(name: 'total_sales') this.totalSales,
      @JsonKey(name: 'rating_count') this.ratingCount,
      @JsonKey(name: 'images') final List<Images>? images})
      : _images = images;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'date_created')
  final String? dataCreated;
  @override
  @JsonKey(name: 'price')
  final String? price;
  @override
  @JsonKey(name: 'regular_price')
  final String? regularPrice;
  @override
  @JsonKey(name: 'sale_price')
  final String? salePrice;
  @override
  @JsonKey(name: 'total_sales')
  final int? totalSales;
  @override
  @JsonKey(name: 'rating_count')
  final int? ratingCount;
  final List<Images>? _images;
  @override
  @JsonKey(name: 'images')
  List<Images>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, dataCreated: $dataCreated, price: $price, regularPrice: $regularPrice, salePrice: $salePrice, totalSales: $totalSales, ratingCount: $ratingCount, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dataCreated, dataCreated) ||
                other.dataCreated == dataCreated) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.regularPrice, regularPrice) ||
                other.regularPrice == regularPrice) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      dataCreated,
      price,
      regularPrice,
      salePrice,
      totalSales,
      ratingCount,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'date_created') final String? dataCreated,
      @JsonKey(name: 'price') final String? price,
      @JsonKey(name: 'regular_price') final String? regularPrice,
      @JsonKey(name: 'sale_price') final String? salePrice,
      @JsonKey(name: 'total_sales') final int? totalSales,
      @JsonKey(name: 'rating_count') final int? ratingCount,
      @JsonKey(name: 'images') final List<Images>? images}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'date_created')
  String? get dataCreated;
  @override
  @JsonKey(name: 'price')
  String? get price;
  @override
  @JsonKey(name: 'regular_price')
  String? get regularPrice;
  @override
  @JsonKey(name: 'sale_price')
  String? get salePrice;
  @override
  @JsonKey(name: 'total_sales')
  int? get totalSales;
  @override
  @JsonKey(name: 'rating_count')
  int? get ratingCount;
  @override
  @JsonKey(name: 'images')
  List<Images>? get images;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return _Images.fromJson(json);
}

/// @nodoc
mixin _$Images {
  @JsonKey(name: 'id')
  int? get lastUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'src')
  String? get src => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesCopyWith<Images> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesCopyWith<$Res> {
  factory $ImagesCopyWith(Images value, $Res Function(Images) then) =
      _$ImagesCopyWithImpl<$Res, Images>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? lastUpdated,
      @JsonKey(name: 'src') String? src,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class _$ImagesCopyWithImpl<$Res, $Val extends Images>
    implements $ImagesCopyWith<$Res> {
  _$ImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdated = freezed,
    Object? src = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as int?,
      src: freezed == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagesImplCopyWith<$Res> implements $ImagesCopyWith<$Res> {
  factory _$$ImagesImplCopyWith(
          _$ImagesImpl value, $Res Function(_$ImagesImpl) then) =
      __$$ImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? lastUpdated,
      @JsonKey(name: 'src') String? src,
      @JsonKey(name: 'name') String? name});
}

/// @nodoc
class __$$ImagesImplCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$ImagesImpl>
    implements _$$ImagesImplCopyWith<$Res> {
  __$$ImagesImplCopyWithImpl(
      _$ImagesImpl _value, $Res Function(_$ImagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdated = freezed,
    Object? src = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ImagesImpl(
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as int?,
      src: freezed == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesImpl implements _Images {
  const _$ImagesImpl(
      {@JsonKey(name: 'id') this.lastUpdated,
      @JsonKey(name: 'src') this.src,
      @JsonKey(name: 'name') this.name});

  factory _$ImagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? lastUpdated;
  @override
  @JsonKey(name: 'src')
  final String? src;
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  String toString() {
    return 'Images(lastUpdated: $lastUpdated, src: $src, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesImpl &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastUpdated, src, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      __$$ImagesImplCopyWithImpl<_$ImagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesImplToJson(
      this,
    );
  }
}

abstract class _Images implements Images {
  const factory _Images(
      {@JsonKey(name: 'id') final int? lastUpdated,
      @JsonKey(name: 'src') final String? src,
      @JsonKey(name: 'name') final String? name}) = _$ImagesImpl;

  factory _Images.fromJson(Map<String, dynamic> json) = _$ImagesImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get lastUpdated;
  @override
  @JsonKey(name: 'src')
  String? get src;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
