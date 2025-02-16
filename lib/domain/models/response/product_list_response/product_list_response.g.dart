// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListResponse _$ProductListResponseFromJson(Map<String, dynamic> json) =>
    ProductListResponse(
      categoryId: json['category_id'] as String?,
      productId: json['product_id'] as String?,
      price: json['price'] as String?,
      priceAfterDiscount: json['price_after_discount'] as String?,
      domesticShippingCost: json['domestic_shipping_cost'],
      internationalShippingCost: json['international_shipping_cost'],
      dispatchTime: json['dispatch_time'] as String?,
      dateAvailable: json['date_available'],
      productBarcodes: json['product_barcodes'] as String?,
      match: json['match'],
      viewed: json['viewed'] as String?,
      coverImage: json['cover_image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imagePath: json['image_path'] as String?,
      newPrice: (json['new_price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductListResponseToJson(
        ProductListResponse instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'product_id': instance.productId,
      'price': instance.price,
      'price_after_discount': instance.priceAfterDiscount,
      'domestic_shipping_cost': instance.domesticShippingCost,
      'international_shipping_cost': instance.internationalShippingCost,
      'dispatch_time': instance.dispatchTime,
      'date_available': instance.dateAvailable,
      'product_barcodes': instance.productBarcodes,
      'match': instance.match,
      'viewed': instance.viewed,
      'cover_image': instance.coverImage,
      'name': instance.name,
      'description': instance.description,
      'image_path': instance.imagePath,
      'new_price': instance.newPrice,
    };
