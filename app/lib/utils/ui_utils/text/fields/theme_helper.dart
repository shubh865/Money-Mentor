import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:flutter/material.dart';

import '../../../../constants/sizeconfig.dart';
import '../../../../core/theme/palette.dart';
// import '../../size/size_config.dart';
import '../text_style.dart';
import '../typography.dart';

class ThemeHelper {
  BuildContext context;
  ThemeHelper({required this.context});
  InputDecoration textInputDecoration([
    String lableText = "",
    String hintText = "",
    Widget? suffixIcon,
    VoidCallback? onTapIcon,
  ]) {
    return InputDecoration(
      labelText: lableText,
      labelStyle: Typo.titleSmall.copyWith(
        color: Theme.of(context).brightness == Brightness.light
            ? Palette.black
            : Palette.white,
      ),
      hintText: hintText,
      hintStyle: hintField(),
      errorMaxLines: 3,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: Palette.transparent,
      border: InputBorder.none,
      suffixIcon: Padding(
        padding: EdgeInsets.all(SizeConfig.getPercentSize(1)),
        child: IconButton(
          icon: suffixIcon ?? const Icon(null),
          color: Palette.black,
          onPressed: onTapIcon,
        ),
      ),
      filled: true,
      // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      contentPadding: EdgeInsets.only(
        top: SizeConfig.getPercentSize(4),
        left: SizeConfig.getPercentSize(4),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(3)),
        borderSide: const BorderSide(
          color: Palette.primaryPurple,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(3)),
        borderSide: const BorderSide(
          color: Palette.grey,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(3)),
        borderSide: const BorderSide(
          color: Palette.redAcc,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(3)),
        borderSide: const BorderSide(
          color: Palette.redAcc,
          width: 2,
        ),
      ),
    );
  }
}
