import 'package:json_annotation/json_annotation.dart';

part 'product_detail_response.g.dart';

@JsonSerializable()
class ProductDetailResponse {
  @JsonKey(name: "product_id")
  String? productId;
  @JsonKey(name: "category_id")
  String? categoryId;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "currency_id")
  dynamic currencyId;
  @JsonKey(name: "quantity")
  String? quantity;
  @JsonKey(name: "manufacturer_id")
  String? manufacturerId;
  @JsonKey(name: "alt_tag")
  String? altTag;
  @JsonKey(name: "sku")
  String? sku;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "discount_startdate")
  DateTime? discountStartdate;
  @JsonKey(name: "discount_enddate")
  DateTime? discountEnddate;
  @JsonKey(name: "price_after_discount")
  String? priceAfterDiscount;
  @JsonKey(name: "domestic_shipping_cost")
  String? domesticShippingCost;
  @JsonKey(name: "international_shipping_cost")
  String? internationalShippingCost;
  @JsonKey(name: "dispatch_time")
  String? dispatchTime;
  @JsonKey(name: "date_available")
  dynamic dateAvailable;
  @JsonKey(name: "sort_order")
  String? sortOrder;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "viewed")
  String? viewed;
  @JsonKey(name: "approved")
  String? approved;
  @JsonKey(name: "product_barcodes")
  String? productBarcodes;
  @JsonKey(name: "match")
  dynamic match;
  @JsonKey(name: "source")
  String? source;
  @JsonKey(name: "max_qty_buy")
  String? maxQtyBuy;
  @JsonKey(name: "product_description_id")
  String? productDescriptionId;
  @JsonKey(name: "language_id")
  dynamic languageId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "cover_image")
  String? coverImage;
  @JsonKey(name: "seo_url")
  String? seoUrl;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "meta_title")
  dynamic metaTitle;
  @JsonKey(name: "meta_description")
  dynamic metaDescription;
  @JsonKey(name: "meta_keyword")
  dynamic metaKeyword;
  @JsonKey(name: "tag")
  dynamic tag;
  @JsonKey(name: "image_path")
  String? imagePath;
  @JsonKey(name: "discount_price")
  int? discountPrice;
  @JsonKey(name: "discount")
  String? discount;

  ProductDetailResponse({
    this.productId,
    this.categoryId,
    this.userId,
    this.currencyId,
    this.quantity,
    this.manufacturerId,
    this.altTag,
    this.sku,
    this.price,
    this.discountStartdate,
    this.discountEnddate,
    this.priceAfterDiscount,
    this.domesticShippingCost,
    this.internationalShippingCost,
    this.dispatchTime,
    this.dateAvailable,
    this.sortOrder,
    this.status,
    this.viewed,
    this.approved,
    this.productBarcodes,
    this.match,
    this.source,
    this.maxQtyBuy,
    this.productDescriptionId,
    this.languageId,
    this.name,
    this.coverImage,
    this.seoUrl,
    this.description =
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    this.metaTitle,
    this.metaDescription,
    this.metaKeyword,
    this.tag,
    this.imagePath,
    this.discountPrice,
    this.discount,
  });

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailResponseToJson(this);
}
