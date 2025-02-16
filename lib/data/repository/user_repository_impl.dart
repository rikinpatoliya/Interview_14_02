import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/core/utils/logger.dart';
import 'package:rikin_interview_14_02/data/data_sources/remote/user_api_services.dart';
import 'package:rikin_interview_14_02/data/repository/base/base_repository.dart';
import 'package:rikin_interview_14_02/domain/models/response/base_response/base_response.dart';
import 'package:rikin_interview_14_02/domain/models/response/product_detail_response/product_detail_response.dart';
import 'package:rikin_interview_14_02/domain/models/response/product_list_response/product_list_response.dart';
import 'package:rikin_interview_14_02/domain/repository/user_repository.dart';

class UserRepositoryImpl extends BaseRepository implements UserRepository {
  UserRepositoryImpl(this._userApiService);

  final UserApiServices _userApiService;

  @override
  Future<ApiResponse<BaseResponse<List<ProductListResponse>>>>
      getProductList() async {
    ApiResponse<String> apiResponse = await apiCall<String>(
      request: () => _userApiService.getProductList(),
    );
    if (apiResponse is ApiResponseSuccess<String>) {
      try {
        String responseStr = apiResponse.value;
        final productResponse =
            BaseResponse<List<ProductListResponse>>.fromJson(
          json.decode(responseStr),
          (data) => (data as List<dynamic>)
              .map((e) => ProductListResponse.fromJson(e))
              .toList(),
        );
        return ApiResponse.success(productResponse);
      } catch (e) {
        return ApiResponse.error('Parsing error');
      }
    } else if (apiResponse is ApiResponseError) {
      return ApiResponse.error(apiResponse.message);
    } else {
      return ApiResponse.error('Something went wrong!');
    }
  }

  @override
  Future<ApiResponse<BaseResponse<List<ProductDetailResponse>>>>
      getProductDetail(String productId) async {
    ApiResponse<String> apiResponse = await apiCall<String>(
      request: () => _userApiService.getProductDetail(productId),
    );
    if (apiResponse is ApiResponseSuccess<String>) {
      try {
        String responseStr = apiResponse.value;
        final productResponse =
            BaseResponse<List<ProductDetailResponse>>.fromJson(
                json.decode(responseStr),
                (data) => (data as List<dynamic>)
                    .map((e) => ProductDetailResponse.fromJson(e))
                    .toList());
        return ApiResponse.success(productResponse);
      } catch (e) {
        logger.e(e);
        return ApiResponse.error('Parsing error');
      }
    } else if (apiResponse is ApiResponseError) {
      return ApiResponse.error(apiResponse.message);
    } else {
      return ApiResponse.error('Something went wrong!');
    }
  }

  @override
  Future<ApiResponse<BaseResponse<List<ProductDetailResponse>>>> addToCart(
      String productId, int qty) async {
    ApiResponse<String> apiResponse = await apiCall<String>(
      request: () => _userApiService.addToCart(productId, qty),
    );
    if (apiResponse is ApiResponseSuccess<String>) {
      try {
        String responseStr = apiResponse.value;
        final productResponse =
            BaseResponse<List<ProductDetailResponse>>.fromJson(
                json.decode(responseStr),
                (data) => (data as List<dynamic>)
                    .map((e) => ProductDetailResponse.fromJson(e))
                    .toList());
        return ApiResponse.success(productResponse);
      } catch (e) {
        logger.e(e);
        return ApiResponse.error('Parsing error');
      }
    } else if (apiResponse is ApiResponseError) {
      return ApiResponse.error(apiResponse.message);
    } else {
      return ApiResponse.error('Something went wrong!');
    }
  }

  @override
  Future<ApiResponse<UserCredential>> logInWithEmailAndPassword(
      {required String username, required String password}) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      return ApiResponse.success(credential);
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      String error = '';
      switch (e.code) {
        case 'invalid-credential':
          error = 'Incorrect emailId and password, please try again.';
        case 'invalid-email':
          error = 'Email is not valid or badly formatted.';
        case 'user-disabled':
          error =
              'This user has been disabled. Please contact support for help.';
        case 'user-not-found':
          error = 'Email is not found, please create an account.';
        case 'wrong-password':
          error = 'Incorrect password, please try again.';
        default:
          error = e.message ?? 'An unknown exception occurred.';
      }

      return ApiResponse.error(error);
    } catch (_) {
      logger.e(_);

      return ApiResponse.error('An unknown exception occurred.');
    }
  }

  @override
  Future<ApiResponse<String>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return ApiResponse.success('success');
    } catch (e) {
      logger.e(e);

      return ApiResponse.error('An unknown exception occurred.');
    }
  }
}
