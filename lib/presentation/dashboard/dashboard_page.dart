import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/config/routes/app_router.dart';
import 'package:rikin_interview_14_02/core/utils/extension/widget_extension.dart';
import 'package:rikin_interview_14_02/domain/entities/response/LocationResponse/value.dart';
import 'package:rikin_interview_14_02/presentation/dashboard/dashboard_cubit.dart';
import 'package:rikin_interview_14_02/presentation/dashboard/dashboard_state.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_colors.dart';
import 'package:rikin_interview_14_02/presentation/user/login/login_page.dart';
import 'package:rikin_interview_14_02/presentation/widget/Text/text_widget.dart';
import 'package:rikin_interview_14_02/presentation/widget/error/no_data_found_widget.dart';
import 'package:rikin_interview_14_02/presentation/widget/textFormField/input_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'Location List',
        ),
        actions: [
          BlocConsumer<DashboardCubit, DashboardState>(
            listener: (context, state) {
              state.uiLogoutState.mapOrNull(
                success: (value) {
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
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        _buildSearchBar(),
        _buildLocationBloc().expanded(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: InputTextFormField(
        hintText: 'Search',
        onChanged: (val) {
          onSearchChanged(val);
        },
      ),
    );
  }

  Widget _buildLocationBloc() {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (_, state) {
        return state.uiLocationState.map(
          idle: (value) => const NoDataFoundWidget(message: 'Search'),
          loading: (value) => const LoadingScreenWidget(),
          empty: (value) => const NoDataFoundWidget(),
          success: (locationRespList) {
            var locationList = locationRespList.data;
            if (locationList != null) {
              return _buildLocationList(locationList);
            } else {
              return const NoDataFoundWidget();
            }
          },
          failure: (value) {
            return NoDataFoundWidget(message: value.reason);
          },
        );
      },
    );
  }

  _buildLocationList(List<Value> locationList) {
    return ListView.separated(
      separatorBuilder: (context, index) => 10.height,
      padding: const EdgeInsets.all(15),
      shrinkWrap: true,
      itemCount: locationList.length,
      itemBuilder: (context, index) {
        var locationObj = locationList[index];
        return _buildLocationItem(locationObj);
      },
    );
  }

  _buildLocationItem(Value locationObj) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: MyColors.colorf5f6f9,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(locationObj.locationName),
          TextWidget(locationObj.location?.location),
        ],
      ),
    );
  }

  onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // do something with query
      context.read<DashboardCubit>().getLocationList(query: query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
