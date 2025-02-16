// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartArgs _$AddToCartArgsFromJson(Map<String, dynamic> json) =>
    AddToCartArgs(
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      productDesc: json['productDesc'] as String?,
      productImage: json['productImage'] as String?,
      productQty: (json['productQty'] as num?)?.toInt(),
      productPrice: json['productPrice'] as String?,
    );

Map<String, dynamic> _$AddToCartArgsToJson(AddToCartArgs instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productDesc': instance.productDesc,
      'productImage': instance.productImage,
      'productQty': instance.productQty,
      'productPrice': instance.productPrice,
    };
