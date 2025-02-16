// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailResponse _$ProductDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailResponse(
      productId: json['product_id'] as String?,
      categoryId: json['category_id'] as String?,
      userId: json['user_id'] as String?,
      currencyId: json['currency_id'],
      quantity: json['quantity'] as String?,
      manufacturerId: json['manufacturer_id'] as String?,
      altTag: json['alt_tag'] as String?,
      sku: json['sku'] as String?,
      price: json['price'] as String?,
      discountStartdate: json['discount_startdate'] == null
          ? null
          : DateTime.parse(json['discount_startdate'] as String),
      discountEnddate: json['discount_enddate'] == null
          ? null
          : DateTime.parse(json['discount_enddate'] as String),
      priceAfterDiscount: json['price_after_discount'] as String?,
      domesticShippingCost: json['domestic_shipping_cost'] as String?,
      internationalShippingCost: json['international_shipping_cost'] as String?,
      dispatchTime: json['dispatch_time'] as String?,
      dateAvailable: json['date_available'],
      sortOrder: json['sort_order'] as String?,
      status: json['status'] as String?,
      viewed: json['viewed'] as String?,
      approved: json['approved'] as String?,
      productBarcodes: json['product_barcodes'] as String?,
      match: json['match'],
      source: json['source'] as String?,
      maxQtyBuy: json['max_qty_buy'] as String?,
      productDescriptionId: json['product_description_id'] as String?,
      languageId: json['language_id'],
      name: json['name'] as String?,
      coverImage: json['cover_image'] as String?,
      seoUrl: json['seo_url'] as String?,
      description: json['description'] as String? ??
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      metaKeyword: json['meta_keyword'],
      tag: json['tag'],
      imagePath: json['image_path'] as String?,
      discountPrice: (json['discount_price'] as num?)?.toInt(),
      discount: json['discount'] as String?,
    );

Map<String, dynamic> _$ProductDetailResponseToJson(
        ProductDetailResponse instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'category_id': instance.categoryId,
      'user_id': instance.userId,
      'currency_id': instance.currencyId,
      'quantity': instance.quantity,
      'manufacturer_id': instance.manufacturerId,
      'alt_tag': instance.altTag,
      'sku': instance.sku,
      'price': instance.price,
      'discount_startdate': instance.discountStartdate?.toIso8601String(),
      'discount_enddate': instance.discountEnddate?.toIso8601String(),
      'price_after_discount': instance.priceAfterDiscount,
      'domestic_shipping_cost': instance.domesticShippingCost,
      'international_shipping_cost': instance.internationalShippingCost,
      'dispatch_time': instance.dispatchTime,
      'date_available': instance.dateAvailable,
      'sort_order': instance.sortOrder,
      'status': instance.status,
      'viewed': instance.viewed,
      'approved': instance.approved,
      'product_barcodes': instance.productBarcodes,
      'match': instance.match,
      'source': instance.source,
      'max_qty_buy': instance.maxQtyBuy,
      'product_description_id': instance.productDescriptionId,
      'language_id': instance.languageId,
      'name': instance.name,
      'cover_image': instance.coverImage,
      'seo_url': instance.seoUrl,
      'description': instance.description,
      'meta_title': instance.metaTitle,
      'meta_description': instance.metaDescription,
      'meta_keyword': instance.metaKeyword,
      'tag': instance.tag,
      'image_path': instance.imagePath,
      'discount_price': instance.discountPrice,
      'discount': instance.discount,
    };
