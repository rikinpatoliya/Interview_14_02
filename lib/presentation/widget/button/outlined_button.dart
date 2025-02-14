import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/core/utils/extension/text_style_extensions.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_colors.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_css.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double? textSize;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? borderRadius;

  const OutlinedButtonWidget({
    super.key,
    required this.text,
    this.textSize,
    required this.onPressed,
    this.padding,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    var style =
        AppCss.circularStdW50016.textColor(textColor ?? MyColors.color000000);
    if (textSize != null) {
      style.copyWith(fontSize: textSize);
    }
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          // minimumSize: Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
          ),
          side:
              BorderSide(width: 1, color: borderColor ?? MyColors.color000000),
        ),
        onPressed: onPressed,
        child: Text(text, style: style),
      ),
    );
  }
}
