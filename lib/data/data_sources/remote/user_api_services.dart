import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'user_api_services.g.dart';

@RestApi()
abstract class UserApiServices {
  factory UserApiServices({required Dio dio}) => _UserApiServices(dio);

  @POST('api/category_productV1')
  Future<String> getProductList();

  @POST('api/category_productV1')
  Future<String> getProductDetail(
    @Query('Product_id') String productId,
  );

  @POST('mobile_api/AddToCart')
  Future<String> addToCart(
    @Query('Product_id') String productId,
    @Query('qty') int qty,
  );
}
