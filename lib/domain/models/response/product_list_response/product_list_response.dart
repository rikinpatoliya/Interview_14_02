import 'package:json_annotation/json_annotation.dart';

part 'product_list_response.g.dart';

@JsonSerializable()
class ProductListResponse {
  @JsonKey(name: "category_id")
  String? categoryId;
  @JsonKey(name: "product_id")
  String? productId;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "price_after_discount")
  String? priceAfterDiscount;
  @JsonKey(name: "domestic_shipping_cost")
  dynamic domesticShippingCost;
  @JsonKey(name: "international_shipping_cost")
  dynamic internationalShippingCost;
  @JsonKey(name: "dispatch_time")
  String? dispatchTime;
  @JsonKey(name: "date_available")
  dynamic dateAvailable;
  @JsonKey(name: "product_barcodes")
  String? productBarcodes;
  @JsonKey(name: "match")
  dynamic match;
  @JsonKey(name: "viewed")
  String? viewed;
  @JsonKey(name: "cover_image")
  String? coverImage;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "image_path")
  String? imagePath;
  @JsonKey(name: "new_price")
  int? newPrice;

  ProductListResponse({
    this.categoryId,
    this.productId,
    this.price,
    this.priceAfterDiscount,
    this.domesticShippingCost,
    this.internationalShippingCost,
    this.dispatchTime,
    this.dateAvailable,
    this.productBarcodes,
    this.match,
    this.viewed,
    this.coverImage,
    this.name,
    this.description,
    this.imagePath,
    this.newPrice,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);
}
