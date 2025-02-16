import 'package:firebase_auth/firebase_auth.dart';
import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/domain/models/response/base_response/base_response.dart';
import 'package:rikin_interview_14_02/domain/models/response/product_detail_response/product_detail_response.dart';
import 'package:rikin_interview_14_02/domain/models/response/product_list_response/product_list_response.dart';

abstract class UserRepository {
  Future<ApiResponse<UserCredential>> logInWithEmailAndPassword(
      {required String username, required String password});

  Future<ApiResponse<String>> logout();

  //! Product //
  Future<ApiResponse<BaseResponse<List<ProductListResponse>>>> getProductList();

  Future<ApiResponse<BaseResponse<List<ProductDetailResponse>>>>
      getProductDetail(String productId);

  Future<ApiResponse<BaseResponse<List<ProductDetailResponse>>>> addToCart(
      String productId, int qty);
}
