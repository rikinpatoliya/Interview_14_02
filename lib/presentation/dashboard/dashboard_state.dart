import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:rikin_interview_14_02/domain/entities/response/LocationResponse/value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  factory DashboardState({
    @Default(UiState.idle()) UiState<List<Value>> uiLocationState,
    @Default(UiState.idle()) UiState<String> uiLogoutState,
  }) = _DashboardState;
}
