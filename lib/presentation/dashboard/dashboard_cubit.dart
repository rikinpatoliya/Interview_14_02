import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:rikin_interview_14_02/domain/models/response/base_response/base_response.dart';
import 'package:rikin_interview_14_02/domain/models/response/product_list_response/product_list_response.dart';
import 'package:rikin_interview_14_02/domain/repository/user_repository.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._userRepository) : super(DashboardState()) {
    getProductList();
  }
  // final GetDashboardUseCase _getProductListUseCase;
  final UserRepository _userRepository;

  Future<void> getProductList({String? query}) async {
    emit(state.copyWith(uiProductListState: const UiState.loading()));
    ApiResponse<BaseResponse<List<ProductListResponse>>> apiResponse =
        await _userRepository.getProductList();
    await Future<void>.delayed(const Duration(milliseconds: 50));
    if (apiResponse
        is ApiResponseSuccess<BaseResponse<List<ProductListResponse>>>) {
      BaseResponse<List<ProductListResponse>> baseResponse = apiResponse.value;
      if (baseResponse.status == 1) {
        final productList = baseResponse.data ?? [];
        if (productList.isNotEmpty) {
          emit(state.copyWith(
              uiProductListState: UiState.success(data: productList)));
        } else {
          emit(state.copyWith(uiProductListState: const UiState.empty()));
        }
      } else {
        emit(state.copyWith(
            uiProductListState: UiState.failure(reason: baseResponse.message)));
      }
    }

    if (apiResponse is ApiResponseError) {
      emit(state.copyWith(
          uiProductListState: UiState.failure(reason: apiResponse.message)));
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
