import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/config/routes/app_router.dart';
import 'package:rikin_interview_14_02/core/resources/ui_state.dart';
import 'package:rikin_interview_14_02/core/utils/extension/text_style_extensions.dart';
import 'package:rikin_interview_14_02/core/utils/validator.dart';
import 'package:rikin_interview_14_02/dependency_container.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_colors.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_css.dart';
import 'package:rikin_interview_14_02/presentation/widget/Text/text_widget.dart';
import 'package:rikin_interview_14_02/presentation/widget/button/submit_btn.dart';
import 'package:rikin_interview_14_02/presentation/widget/error/no_data_found_widget.dart';
import 'package:rikin_interview_14_02/presentation/widget/textFormField/input_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_cubit.dart';
import 'login_state.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorFFFFFF,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              // var loginCubit = context.read<LoginCubit>();
              state.uiState.mapOrNull(
                success: (value) {
                  /*  if (value.data != null) {
                    context.pushRoute(VerifyCodeRoute(contactData: loginCubit.usernameCtrl.text));
                  } else {
                    context.router.pushAndPopUntil(const DashboardRoute(), predicate: (route) => false);
                  } */
                  // context.router.popUntilRouteWithName(RoutesNames.dashboardPage);
                  context.router.pushAndPopUntil(const DashboardRoute(),
                      predicate: (route) => false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: TextWidget('Login successfully')),
                  );
                },
                failure: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: TextWidget(value.reason)),
                  );
                },
              );
            },
            builder: (context, state) {
              return _buildLoginUi(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoginUi(BuildContext context, LoginState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          _buildGreeting(),
          const SizedBox(height: 50),
          _buildLoginForm(context, state),
        ],
      ),
    );
  }

  _buildLoginForm(BuildContext context, LoginState state) {
    var loginCubit = context.read<LoginCubit>();
    return Form(
      key: loginCubit.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTextFormField(
            hintText: 'Email',
            maxLines: 1,
            readOnly: state.uiState is Loading,
            filled: state.uiState is Loading ? true : false,
            filledColor: MyColors.colorf5f6f9,
            textEditingController: loginCubit.usernameCtrl,
            validator: (value) => validateEmailId(
              value,
            ),
          ),
          const SizedBox(height: 20),
          InputTextFormField(
            hintText: 'Password',
            obscureText: true,
            maxLines: 1,
            readOnly: state.uiState is Loading,
            filled: state.uiState is Loading ? true : false,
            filledColor: MyColors.colorf5f6f9,
            validator: (value) =>
                validateNullOrBlank(value, 'Please enter password'),
            textEditingController: loginCubit.passwordCtrl,
            textInputAction: TextInputAction.done,
            /* suffixIconWidget: GestureDetector(
              onTap: () {
                context.router.navigateNamed(RoutesNames.forgotPasswordpage);
              },
              child: const Text(
                'Forgot',
                style: TextStyle(
                  color: Color(0xff1e69b5),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ), */
          ),
          // if (state.passwordError.isNotEmpty) ...[
          //   const SizedBox(height: 5),
          //   for (String error in state.passwordError) ...[
          //     Text(
          //       error,
          //       style: const TextStyle(
          //         fontWeight: FontWeight.w400,
          //         color: MyColors.colord42222,
          //         fontSize: 12,
          //       ),
          //     ),
          //     const SizedBox(height: 3),
          //   ]
          // ],
          const SizedBox(height: 45),
          if (state.uiState is Loading) ...[
            const LoadingScreenWidget()
          ] else ...[
            SubmitButton(
              text: 'Log in',
              onPressed: () {
                if (loginCubit.loginFormKey.currentState!.validate()) {
                  loginCubit.loginFormKey.currentState!.save();
                  loginCubit.authenticate();
                }
                // context.navigateTo(const VerifyCodeRoute());
              },
            )
          ]
        ],
      ),
    );
  }

  _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: AppCss.circularStdW40020.textColor(MyColors.color121317),
        ),
        Text(
          'My App',
          style: AppCss.circularStdW70020.textColor(MyColors.color121317),
        ),
      ],
    );
  }
}
