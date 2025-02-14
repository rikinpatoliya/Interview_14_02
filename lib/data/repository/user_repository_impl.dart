import 'package:firebase_auth/firebase_auth.dart';
import 'package:rikin_interview_14_02/core/const/app_const.dart';
import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/core/utils/logger.dart';
import 'package:rikin_interview_14_02/data/data_sources/remote/user_api_services.dart';
import 'package:rikin_interview_14_02/data/dio/network_exceptions.dart';
import 'package:rikin_interview_14_02/domain/entities/response/LocationResponse/location_response.dart';
import 'package:rikin_interview_14_02/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userApiService);

  final UserApiServices _userApiService;
  @override
  Future<ApiResponse<LocationResponse>> getLocationList({String? query}) async {
    try {
      final locationResponse = await _userApiService.getNewsArticles(
        suggest: query,
        limit: pageLimit,
        searchFields: 'new_locations',
      );
      return ApiResponse.success(locationResponse);
    } catch (error) {
      NetworkExceptions networkExcl = NetworkExceptions.getDioException(error);
      var message = NetworkExceptions.getErrorMessage(networkExcl);
      return ApiResponse.error(message);
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
