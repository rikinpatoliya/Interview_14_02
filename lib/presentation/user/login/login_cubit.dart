import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:rikin_interview_14_02/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._userRepository) : super(LoginState());

  final UserRepository _userRepository;

  final loginFormKey = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  Future<void> authenticate() async {
    emit(state.copyWith(uiState: const UiState.loading()));
    ApiResponse apiResponse = await _userRepository.logInWithEmailAndPassword(
        username: usernameCtrl.text.trim(), password: passwordCtrl.text.trim());
    if (apiResponse is ApiResponseSuccess) {
      // HttpResponse httpResponse = apiResponse.value;
      emit(state.copyWith(uiState: UiState.success(data: apiResponse.value)));
    }
    if (apiResponse is ApiResponseError) {
      emit(state.copyWith(
          uiState: UiState.failure(reason: apiResponse.message)));
    }
  }

  @override
  Future<void> close() {
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    return super.close();
  }
}
