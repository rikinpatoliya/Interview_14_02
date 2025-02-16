import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikin_interview_14_02/config/routes/app_router.dart';
import 'package:rikin_interview_14_02/core/utils/extension/widget_extension.dart';
import 'package:rikin_interview_14_02/dependency_container.dart';
import 'package:rikin_interview_14_02/domain/models/response/product_detail_response/product_detail_response.dart';
import 'package:rikin_interview_14_02/presentation/product_detail/product_detail_cubit.dart';
import 'package:rikin_interview_14_02/presentation/product_detail/product_detail_state.dart';
import 'package:rikin_interview_14_02/presentation/widget/Text/text_widget.dart';
import 'package:rikin_interview_14_02/presentation/widget/error/no_data_found_widget.dart';

@RoutePage()
class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final productDetailCubit = getIt<ProductDetailCubit>();
  @override
  void initState() {
    productDetailCubit.getProductDetailByProductId(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'Product Detail',
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.router.navigate(CartDetailRoute());
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: BlocProvider<ProductDetailCubit>.value(
        value: productDetailCubit,
        child: BlocListener<ProductDetailCubit, ProductDetailState>(
          listener: (context, state) {
            state.addToCartState.maybeWhen(
              loading: () {
                // showProgressDialog(context);
                context.router.navigate(CartDetailRoute());
              },
              orElse: () {
                // dismissDialog();
              },
            );
          },
          child: _buildLocationBloc(context),
        ),
      ),
    );
  }

  Widget _buildLocationBloc(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (_, state) {
        return state.uiProductDetailState.map(
          idle: (value) => const NoDataFoundWidget(
              message: 'Fetching Product Product Detail...'),
          loading: (value) => const LoadingScreenWidget(),
          empty: (value) => const NoDataFoundWidget(),
          success: (productDetailRespObj) {
            var productDetailObj = productDetailRespObj.data;
            if (productDetailObj != null) {
              return _buildProductDetail(productDetailObj);
            } else {
              return const NoDataFoundWidget();
            }
          },
          failure: (value) {
            return NoDataFoundWidget(
              message: value.reason,
              btnRetry: () {
                productDetailCubit
                    .getProductDetailByProductId(widget.productId);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildProductDetail(ProductDetailResponse productObj) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.network(productObj.imagePath!),
                10.height,
                Row(
                  children: [
                    Text(productObj.name ?? '-'),
                    // SizedBox(height: 5),
                    Spacer(),
                    Text(productObj.price ?? '-'),
                  ],
                ),
                20.height,
                Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. "),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            productDetailCubit.addToCart(productObj);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(double.infinity, 56),
          ),
          child: Text('Add To Cart'),
        ),
        16.height,
      ],
    );
  }
}
