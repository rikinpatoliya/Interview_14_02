import 'package:flutter/material.dart';
import 'package:rikin_interview_14_02/core/utils/extension/text_style_extensions.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_colors.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_css.dart';

class SubmitButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double? textSize;
  final Color? textColor;
  final Color? enableColor;
  final Color? disableColor;
  final double? width;
  // final double? height;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const SubmitButton({
    super.key,
    required this.text,
    this.textSize,
    this.textColor,
    this.enableColor,
    this.disableColor,
    this.width,
    // this.height,
    this.padding,
    this.borderRadius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      // height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
              padding ?? const EdgeInsets.symmetric(vertical: 15)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return enableColor ?? MyColors.color00922f;
            } else if (states.contains(MaterialState.disabled)) {
              return disableColor ?? MyColors.color000000.withOpacity(0.3);
            }
            return enableColor ?? MyColors.color00922f;
          }),
          /*  textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(color: Colors.white);
              } else if (states.contains(MaterialState.disabled)) {
                return const TextStyle(color: Colors.white);
              }
              return const TextStyle(color: Colors.white);
            }), */
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8)),
          ),
        ),
        onPressed: onPressed,
        // style: ElevatedButton.styleFrom(primary: MyColors.color_0c92b5,),
        child: Text(
          text.toUpperCase(),
          style: AppCss.circularStdW70018
              .textColor(textColor ?? MyColors.colorFFFFFF),
        ),
      ),
    );
  }
}
