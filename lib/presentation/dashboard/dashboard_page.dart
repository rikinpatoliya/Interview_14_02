import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikin_interview_14_02/config/routes/app_router.dart';
import 'package:rikin_interview_14_02/core/utils/extension/widget_extension.dart';
import 'package:rikin_interview_14_02/core/utils/share_prefs.dart';
import 'package:rikin_interview_14_02/dependency_container.dart';
import 'package:rikin_interview_14_02/domain/models/response/product_list_response/product_list_response.dart';
import 'package:rikin_interview_14_02/presentation/dashboard/dashboard_cubit.dart';
import 'package:rikin_interview_14_02/presentation/dashboard/dashboard_state.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_colors.dart';
import 'package:rikin_interview_14_02/presentation/widget/Text/text_widget.dart';
import 'package:rikin_interview_14_02/presentation/widget/error/no_data_found_widget.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const TextWidget(
            'Product List',
          ),
          actions: [
            BlocConsumer<DashboardCubit, DashboardState>(
              listener: (context, state) {
                state.uiLogoutState.mapOrNull(
                  success: (value) {
                    sharedPrefs.setIsLoggedIn(false);
                    context.router.replaceNamed(RoutesNames.loginPage);
                  },
                  failure: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: TextWidget(value.reason)),
                    );
                  },
                );
              },
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context.read<DashboardCubit>().logout();
                    },
                    icon: const Icon(Icons.logout));
              },
            ),
          ],
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              context.read<DashboardCubit>().getProductList();
            },
            child: _buildLocationBloc(context)),
      ),
    );
  }

  Widget _buildLocationBloc(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (_, state) {
        return state.uiProductListState.map(
          idle: (value) =>
              const NoDataFoundWidget(message: 'Fetching Product List...'),
          loading: (value) => const LoadingScreenWidget(),
          empty: (value) => const NoDataFoundWidget(),
          success: (productRespList) {
            var productList = productRespList.data;
            if (productList != null) {
              return _buildProductList(productList);
            } else {
              return const NoDataFoundWidget();
            }
          },
          failure: (value) {
            return NoDataFoundWidget(
              message: value.reason,
              btnRetry: () {
                context.read<DashboardCubit>().getProductList();
              },
            );
          },
        );
      },
    );
  }

  _buildProductList(List<ProductListResponse> productList) {
    return GridView.builder(
      // separatorBuilder: (context, index) => 10.height,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      padding: const EdgeInsets.all(15),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final locationObj = productList[index];
        return _buildLocationItem(locationObj, context);
      },
    );
  }

  Widget _buildLocationItem(
      ProductListResponse productObj, BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.navigate(
          ProductDetailRoute(productId: productObj.productId!),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: MyColors.colorf5f6f9,
            border: Border.all(color: Colors.black, width: 0.5)),
        child: Column(
          children: [
            Image.network(
              productObj.imagePath!,
              width: 70,
            ),
            10.height,
            TextWidget(productObj.name),
            // TextWidget(productObj.location?.location),
          ],
        ),
      ),
    );
  }
}
