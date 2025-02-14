import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(UiState.idle()) UiState uiState,
  }) = _LoginState;
}
