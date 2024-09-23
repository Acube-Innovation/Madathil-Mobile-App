import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madathil/utils/color/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;

  final String? hint;
  final String hint2;
  final int maxLength;
  final int maxLines;
  final bool enabled;
  final bool addBorder;
  final bool onlyEnglish;
  final double height;
  final Widget? suffixIcon;
  final Color? hintcolor;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onchaged;
  final TextCapitalization? textCapitalization;
  bool hasBeenUsed = false;
  bool? readOnly = false;

  CustomTextField(
      {super.key,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.obscureText = false,
      this.maxLength = 30,
      this.maxLines = 1,
      this.enabled = true,
      this.hint2 = '',
      this.onlyEnglish = false,
      this.hint,
      this.addBorder = true,
      this.height = 1,
      this.validator,
      this.onchaged,
      this.suffixIcon,
      this.hintcolor,
      this.readOnly,
      this.inputFormatters,
      this.textCapitalization});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      cursorWidth: 2.0,
      readOnly: readOnly ?? false,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onchaged,
      style: const TextStyle(
          color: Color.fromRGBO(37, 37, 37, 1), fontFamily: "SF Pro Display"),
      obscureText: obscureText,
      enabled: enabled,
      keyboardType: keyboardType,
      enableInteractiveSelection: true,
      controller: controller,
      showCursor: true,
      maxLength: maxLength,
      autofocus: false,
      maxLines: maxLines,
      cursorColor: AppColors.black,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        enabled: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: AppColors.black!),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: AppColors.primeryColor, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: AppColors.primeryColor, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: AppColors.primeryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: AppColors.red!),
        ),
        hintText: hint,
        counterText: "",
        hintStyle: TextStyle(
          // fontFamily: "SF Pro Display",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.275,
          color: hintcolor ?? AppColors.grey,
        ),
      ),
    );
  }
}
