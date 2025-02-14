import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rikin_interview_14_02/core/utils/extension/text_style_extensions.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_colors.dart';
import 'package:rikin_interview_14_02/presentation/themes/app_css.dart';

class InputTextFormField extends StatelessWidget {
  final Function(String? val)? onSaved;
  final Function(String val)? onFieldSubmitted;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIconWidget;
  final int? maxLines;
  final int? minLines;
  final bool? obscureText;
  final String? obscuringCharacter;
  final int? maxLength;
  final Function()? onTap;
  final double? mainFontSize;
  final List<TextInputFormatter>? textInputFormatter;

  final ValueChanged<String>? onChanged;
  final Color? filledColor;
  final bool? filled;
  final Iterable<String>? autofillHints;
  final EdgeInsets? contentPadding;
  final bool isChange;
  final Function()? onTapOnChange;

  const InputTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.onFieldSubmitted,
    this.textEditingController,
    this.validator,
    this.readOnly,
    this.suffixIconWidget,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.obscuringCharacter,
    this.obscureText,
    this.maxLength,
    this.keyboardType,
    this.textInputFormatter,
    this.mainFontSize,
    this.textInputAction,
    this.onChanged,
    this.filledColor,
    this.filled,
    this.autofillHints,
    this.contentPadding,
    this.isChange = false,
    this.onTapOnChange,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* Container(
          margin: const EdgeInsets.only(top: 1),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MyColors.colorEEC63C),
          ),
        ), */
        TextFormField(
          inputFormatters: textInputFormatter,
          // inputFormatters: [spaceNotAllowed(), ...textInputFormatter ?? []],
          validator: validator,
          controller: textEditingController,
          textInputAction: textInputAction ?? TextInputAction.next,
          keyboardType: keyboardType,
          onSaved: onSaved,
          onTap: onTap,
          autofillHints: autofillHints,
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          obscuringCharacter: obscuringCharacter ?? '•',
          maxLength: maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly ?? false,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: maxLines,
          minLines: minLines,
          style: AppCss.circularStdW60016.textColor(MyColors.color000000),

          decoration: InputDecoration(
            counterText: '',
            alignLabelWithHint: true,
            errorMaxLines: 2,
            // labelText: hintText,
            // labelStyle: AppCss.circularStdW40016.textColor(MyColors.colorA9A9A9),
            // alignLabelWithHint: true,
            hintText: hintText,
            hintStyle: AppCss.circularStdW40016.textColor(MyColors.color000000),
            errorStyle:
                AppCss.circularStdW50012.textColor(MyColors.colorbb2121),
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            filled: filled ?? true,
            fillColor: filledColor ?? MyColors.colorFFFFFF,
            // border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: MyColors.color000000.withOpacity(0.7), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: MyColors.color000000.withOpacity(0.7), width: 2),
              // borderSide: BorderSide(color: focusedBorder ?? color000000),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: MyColors.colorbb2121, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: MyColors.colorbb2121, width: 2),
            ),
            // suffixIconConstraints: BoxConstraints.tight(const Size(40, 40)),
            suffixIcon: suffixIconWidget != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /* if (isChange) ...[
                        InkWell(
                          onTap: onTapOnChange,
                          child: Text(
                            'Change',
                            style: AppCss.poppinsW50013.textColor(MyColors.colorEA5455),
                          ),
                        ),
                      ], */
                      IconButton(
                        onPressed: onTap,
                        visualDensity: VisualDensity.comfortable,
                        icon: Align(
                            alignment: Alignment.center,
                            child: suffixIconWidget!),
                      ),
                    ],
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
