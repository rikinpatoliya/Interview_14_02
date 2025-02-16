import 'package:json_annotation/json_annotation.dart';
part 'add_to_cart.g.dart';

@JsonSerializable()
class AddToCartArgs {
  AddToCartArgs({
    this.productId,
    this.productName,
    this.productDesc,
    this.productImage,
    this.productQty,
    this.productPrice,
  });

  String? productId;
  String? productName;
  String? productDesc;
  String? productImage;
  int? productQty;
  String? productPrice;

  factory AddToCartArgs.fromJson(Map<String, dynamic> json) =>
      _$AddToCartArgsFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartArgsToJson(this);
}
