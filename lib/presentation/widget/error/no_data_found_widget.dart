import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/core/utils/extension/text_style_extensions.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_colors.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_css.dart';
import 'package:rikin_interview_14_02/presentation/widget/Text/text_widget.dart';
import 'package:rikin_interview_14_02/presentation/widget/button/outlined_button.dart';

class NoDataFoundWidget extends StatelessWidget {
  final String? message;
  final Function()? btnRetry;
  final String? subDesc;
  final String? imagePath;
  final bool isDarkTheme;

  const NoDataFoundWidget({
    super.key,
    this.message,
    this.subDesc,
    this.btnRetry,
    this.imagePath,
    this.isDarkTheme = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // if (imagePath != null) ...[
          //   SvgPicture.asset(imagePath!),
          // ],
          const SizedBox(height: 27),
          Text(
            message ?? 'No Data Found.',
            textAlign: TextAlign.center,
            style: AppCss.circularStdW40016.textColor(MyColors.color000000),
          ),
          const SizedBox(height: 5),
          if (subDesc != null) ...[
            TextWidget(
              subDesc,
              textAlign: TextAlign.center,
              style: AppCss.circularStdW50014.textColor(MyColors.color000000),
            ),
          ],
          const SizedBox(height: 10),
          if (btnRetry != null) ...[
            OutlinedButtonWidget(
              onPressed: btnRetry,
              text: 'Try Again',
            )
          ]
        ],
      ),
    );
  }
}

class LoadingScreenWidget extends StatelessWidget {
  const LoadingScreenWidget({
    super.key,
    this.width,
    this.height,
    this.color,
    this.strokeWidth,
  });

  final double? width;
  final double? height;
  final Color? color;
  final double? strokeWidth;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? 40,
        height: height ?? 40,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 4,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? MyColors.color000000,
          ),
        ),
      ),
    );
  }
}
