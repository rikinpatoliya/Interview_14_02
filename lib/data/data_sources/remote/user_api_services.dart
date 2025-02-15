import 'package:dio/dio.dart' hide Headers;
import 'package:rikin_interview_14_02/domain/entities/response/LocationResponse/location_response.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_services.g.dart';

@RestApi()
abstract class UserApiServices {
  factory UserApiServices({required Dio dio}) => _UserApiServices(dio);

  @GET('autocomplete')
  Future<LocationResponse> getNewsArticles({
    @Query("suggest") String? suggest,
    @Query("limit") int? limit,
    @Query("searchFields") String? searchFields,
  });

  @GET('category_productV1')
  Future<LocationResponse> getProductList();
}
