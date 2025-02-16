import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:rikin_interview_14_02/domain/models/response/product_detail_response/product_detail_response.dart';

part 'product_detail_state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  factory ProductDetailState({
    @Default(UiState.idle())
    UiState<ProductDetailResponse> uiProductDetailState,
    @Default(UiState.idle()) UiState addToCartState,
  }) = _ProductDetailState;
}
