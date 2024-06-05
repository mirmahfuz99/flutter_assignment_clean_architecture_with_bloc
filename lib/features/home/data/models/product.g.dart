// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      dataCreated: json['date_created'] as String?,
      price: json['price'] as String?,
      regularPrice: json['regular_price'] as String?,
      salePrice: json['sale_price'] as String?,
      totalSales: (json['total_sales'] as num?)?.toInt(),
      ratingCount: (json['rating_count'] as num?)?.toInt(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date_created': instance.dataCreated,
      'price': instance.price,
      'regular_price': instance.regularPrice,
      'sale_price': instance.salePrice,
      'total_sales': instance.totalSales,
      'rating_count': instance.ratingCount,
      'images': instance.images,
    };

_$ImagesImpl _$$ImagesImplFromJson(Map<String, dynamic> json) => _$ImagesImpl(
      lastUpdated: (json['id'] as num?)?.toInt(),
      src: json['src'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ImagesImplToJson(_$ImagesImpl instance) =>
    <String, dynamic>{
      'id': instance.lastUpdated,
      'src': instance.src,
      'name': instance.name,
    };
