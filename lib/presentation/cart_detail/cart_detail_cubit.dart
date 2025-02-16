import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:rikin_interview_14_02/core/utils/share_prefs.dart';
import 'package:rikin_interview_14_02/domain/models/args/add_to_cart/add_to_cart.dart';
import 'package:rikin_interview_14_02/presentation/cart_detail/cart_detail_state.dart';

class CartDetailCubit extends Cubit<CartDetailState> {
  CartDetailCubit() : super(CartDetailState()) {
    loadCartList();
  }

  Future<void> loadCartList() async {
    emit(state.copyWith(cartItemListState: UiState.loading()));
    try {
      var cartItemList = await sharedPrefs.getAddToCartData();
      // Temporary delay
      await Future.delayed(Duration(seconds: 2));
      if (cartItemList.isNotEmpty) {
        emit(state.copyWith(
            cartItemListState: UiState.success(data: cartItemList)));
      } else {
        emit(state.copyWith(cartItemListState: UiState.empty()));
      }
    } catch (e) {
      emit(state.copyWith(
          cartItemListState: UiState.failure(reason: 'Something went wrong')));
    }
  }

  Future<void> updateCart(AddToCartArgs cartItemObj, num value) async {
    emit(state.copyWith(cartItemListState: const UiState.loading()));
    List<AddToCartArgs> cartItems = await sharedPrefs.getAddToCartData();
    if (value != 0) {
      int index = cartItems.indexWhere(
          (cartItem) => cartItem.productId == cartItemObj.productId);

      if (index != -1) {
        // Update the existing item quantity or other details
        cartItems[index] = AddToCartArgs(
          productId: cartItems[index].productId,
          productName: cartItems[index].productName,
          productQty: value.toInt(), // Increment quantity
          productDesc: cartItems[index].productDesc,
          productImage: cartItems[index].productImage,
          productPrice: cartItems[index].productPrice,
        );
      } else {
        // Add new item to cart
        cartItems.add(cartItemObj);
      }
    } else {
      cartItems.removeWhere(
        (element) => element.productId == cartItemObj.productId,
      );
    }
    // }
    sharedPrefs.setAddToCart(cartItems);
    var cartItemList = await sharedPrefs.getAddToCartData();
    await Future.delayed(Duration(seconds: 2));
    if (cartItemList.isNotEmpty) {
      emit(state.copyWith(
          cartItemListState: UiState.success(data: cartItemList)));
    } else {
      emit(state.copyWith(cartItemListState: UiState.empty()));
    }
  }
}
