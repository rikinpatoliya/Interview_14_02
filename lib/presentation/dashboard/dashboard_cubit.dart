import 'dart:async';

import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:rikin_interview_14_02/domain/entities/response/LocationResponse/location_response.dart';
import 'package:rikin_interview_14_02/domain/entities/response/LocationResponse/value.dart';
import 'package:rikin_interview_14_02/domain/repository/user_repository.dart';
import 'package:rikin_interview_14_02/domain/usercases/get_dashboard_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._getArticleUseCase, this._userRepository)
      : super(DashboardState()) {
    getLocationList();
  }
  final GetDashboardUseCase _getArticleUseCase;
  final UserRepository _userRepository;

  Future<void> getLocationList({String? query}) async {
    emit(state.copyWith(uiLocationState: const UiState.loading()));
    ApiResponse apiResponse = await _getArticleUseCase(params: query);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    if (apiResponse is ApiResponseSuccess) {
      LocationResponse? locationRespObj = apiResponse.value;
      if (locationRespObj != null) {
        List<Value>? locationRespList = locationRespObj.value;
        if (locationRespList != null && locationRespList.isNotEmpty) {
          emit(state.copyWith(
              uiLocationState: UiState.success(data: locationRespList)));
        } else {
          emit(state.copyWith(uiLocationState: const UiState.empty()));
        }
      } else {
        emit(state.copyWith(
            uiLocationState:
                const UiState.failure(reason: 'Something went wrong')));
      }
    }

    if (apiResponse is ApiResponseError) {
      emit(state.copyWith(
          uiLocationState: UiState.failure(reason: apiResponse.message)));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(uiLogoutState: const UiState.loading()));
    ApiResponse apiResponse = await _userRepository.logout();
    if (apiResponse is ApiResponseSuccess) {
      // HttpResponse httpResponse = apiResponse.value;
      emit(state.copyWith(
          uiLogoutState: UiState.success(data: apiResponse.value)));
    }
    if (apiResponse is ApiResponseError) {
      emit(state.copyWith(
          uiLogoutState: UiState.failure(reason: apiResponse.message)));
    }
  }
}
