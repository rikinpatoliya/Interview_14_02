import 'package:firebase_auth/firebase_auth.dart';
import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/domain/entities/response/LocationResponse/location_response.dart';

abstract class UserRepository {
  // API Methods
  Future<ApiResponse<LocationResponse>> getLocationList({String? query});

  Future<ApiResponse<UserCredential>> logInWithEmailAndPassword(
      {required String username, required String password});

  Future<ApiResponse<String>> logout();
}
