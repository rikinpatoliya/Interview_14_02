import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:rikin_interview_14_02/domain/models/args/add_to_cart/add_to_cart.dart';

part 'cart_detail_state.freezed.dart';

@freezed
class CartDetailState with _$CartDetailState {
  factory CartDetailState({
    @Default(UiState.idle()) UiState<List<AddToCartArgs>> cartItemListState,
  }) = _CartDetailState;
}
