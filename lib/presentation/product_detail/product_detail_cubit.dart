import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikin_interview_14_02/core/resources/api_response.dart';
import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:rikin_interview_14_02/core/utils/share_prefs.dart';
import 'package:rikin_interview_14_02/domain/models/args/add_to_cart/add_to_cart.dart';
import 'package:rikin_interview_14_02/domain/models/response/base_response/base_response.dart';
import 'package:rikin_interview_14_02/domain/models/response/product_detail_response/product_detail_response.dart';
import 'package:rikin_interview_14_02/domain/repository/user_repository.dart';
import 'package:rikin_interview_14_02/presentation/product_detail/product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this._userRepository) : super(ProductDetailState());
  final UserRepository _userRepository;

  Future<void> getProductDetailByProductId(String productId) async {
    emit(state.copyWith(uiProductDetailState: const UiState.loading()));
    ApiResponse<BaseResponse<List<ProductDetailResponse>>> apiResponse =
        await _userRepository.getProductDetail(productId);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    if (apiResponse
        is ApiResponseSuccess<BaseResponse<List<ProductDetailResponse>>>) {
      BaseResponse<List<ProductDetailResponse>> baseResponse =
          apiResponse.value;
      if (baseResponse.status == 1) {
        final productDetailList = baseResponse.data;
        var productDetailObj = productDetailList
            ?.firstWhere((element) => element.productId == productId);
        if (productDetailObj != null) {
          emit(state.copyWith(
              uiProductDetailState: UiState.success(data: productDetailObj)));
        } else {
          emit(state.copyWith(uiProductDetailState: const UiState.empty()));
        }
      } else {
        emit(state.copyWith(
            uiProductDetailState:
                UiState.failure(reason: baseResponse.message)));
      }
    } else if (apiResponse is ApiResponseError) {
      emit(state.copyWith(
          uiProductDetailState: UiState.failure(reason: apiResponse.message)));
    }
  }

  Future<void> addToCart(ProductDetailResponse productObj) async {
    emit(state.copyWith(addToCartState: const UiState.loading()));
    var addToCartArgs = AddToCartArgs(
      productId: productObj.productId ?? '',
      productName: productObj.name ?? '',
      productDesc: productObj.description ?? '',
      productImage: productObj.imagePath ?? '',
      productQty: 1,
      productPrice: productObj.price,
    );
    List<AddToCartArgs> cartItems = await sharedPrefs.getAddToCartData();
    if (cartItems.isEmpty) {
      cartItems.add(addToCartArgs);
    } else {
      int index = cartItems.indexWhere(
          (cartItem) => cartItem.productId == addToCartArgs.productId);

      if (index != -1) {
        // Update the existing item quantity or other details
        cartItems[index] = AddToCartArgs(
          productId: cartItems[index].productId,
          productName: cartItems[index].productName,
          productQty: (cartItems[index].productQty ?? 0) +
              (addToCartArgs.productQty ?? 0), // Increment quantity
          productDesc: cartItems[index].productDesc,
          productImage: cartItems[index].productImage,
          productPrice: cartItems[index].productPrice,
        );
      } else {
        // Add new item to cart
        cartItems.add(addToCartArgs);
      }
    }
    sharedPrefs.setAddToCart(cartItems);
    emit(state.copyWith(addToCartState: UiState.success()));
  }
}
