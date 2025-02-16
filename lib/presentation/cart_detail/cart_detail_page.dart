import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikin_interview_14_02/dependency_container.dart';
import 'package:rikin_interview_14_02/domain/models/args/add_to_cart/add_to_cart.dart';
import 'package:rikin_interview_14_02/presentation/cart_detail/cart_detail_cubit.dart';
import 'package:rikin_interview_14_02/presentation/cart_detail/cart_detail_state.dart';
import 'package:rikin_interview_14_02/presentation/widget/custom_number_picker/custom_number_picker.dart';
import 'package:rikin_interview_14_02/presentation/widget/error/no_data_found_widget.dart';

@RoutePage()
class CartDetailPage extends StatelessWidget {
  CartDetailPage({super.key});

  final cartDetailCubit = getIt<CartDetailCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Detail'),
      ),
      body: BlocProvider.value(
        value: cartDetailCubit,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<CartDetailCubit, CartDetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.cartItemListState.maybeWhen(
          loading: () => LoadingScreenWidget(),
          success: (cartItemList) {
            cartItemList ??= [];
            return _buildCartItemList(cartItemList);
          },
          empty: () => NoDataFoundWidget(),
          failure: (reason) => NoDataFoundWidget(message: reason),
          orElse: () => NoDataFoundWidget(),
        );
      },
    );
  }

  Widget _buildCartItemList(List<AddToCartArgs> cartItemList) {
    return ListView.separated(
      itemCount: cartItemList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        var cartItemObj = cartItemList[index];
        return _buildCartItem(cartItemObj);
      },
    );
  }

  Widget _buildCartItem(AddToCartArgs cartItemObj) {
    return ListTile(
      leading: Image.network(cartItemObj.productImage!),
      title: Text(cartItemObj.productName ?? '-'),
      subtitle: Text('₹ ${cartItemObj.productPrice}'),
      trailing: CustomNumberPicker<num>(
        initialValue: cartItemObj.productQty ?? 1,
        maxValue: 10,
        minValue: 0,
        step: 1,
        customAddButton: Container(
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.all(8.0),
          child: const Icon(Icons.add, color: Colors.black38, size: 15),
        ),
        customMinusButton: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.all(8.0),
          child: const Icon(Icons.remove, color: Colors.black38, size: 15),
        ),
        onValue: (value) {
          cartDetailCubit.updateCart(cartItemObj, value);
        },
      ),
    );
  }
}
