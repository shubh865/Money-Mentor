import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/palette.dart';
import '../size/size_config.dart';
import '../text/typography.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final padding;
  final EdgeInsetsGeometry? margin;
  final Color? btnTxtColor;
  final btnTextStyl;
  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.btnTxtColor,
    this.btnTextStyl,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? SizeConfig.getPercentSize(14),
        width: width ?? SizeConfig.getPercentSize(80),
        padding: padding,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              SizeConfig.getPercentSize(3),
            ),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Palette.black,
                Palette.primaryBlue,
              ],
            )),
        child: Text(
          text,
          style: btnTextStyl ??
              Typo.titleMedium.copyWith(
                color: Palette.white,
              ),
          //  largeButton(color: btnTxtColor),
        ),
      ),
    );
  }
}

class BorderedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? image;
  final double? height;
  final double? width;
  final Color? btnTxtColor;
  final bool isSvg;

  const BorderedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.image,
    this.height,
    this.width,
    this.btnTxtColor,
    this.isSvg = false,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? SizeConfig.getPercentSize(14),
        width: width ?? SizeConfig.getPercentSize(60),
        margin: EdgeInsets.all(
          SizeConfig.getPercentSize(2),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Palette.black.withOpacity(0.1)
              : Palette.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            SizeConfig.getPercentSize(3),
          ),
          border: Border.all(
            width: SizeConfig.getPercentSize(0.5),
            color: Theme.of(context).brightness == Brightness.light
                ? Palette.black.withOpacity(0.5)
                : Palette.white.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            isSvg
                ? SvgPicture.asset(
                    image!,
                    height: SizeConfig.getPercentSize(6.5),
                    width: SizeConfig.getPercentSize(6.5),
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.light
                          ? Palette.black
                          : Palette.white,
                      BlendMode.srcIn,
                    ),
                  )
                : image != null
                    ? SvgPicture.asset(
                        image!,
                        height: SizeConfig.getPercentSize(7),
                        width: SizeConfig.getPercentSize(7),
                        fit: BoxFit.contain,
                      )
                    : Text(text, style: Typo.titleSmall),
            Text(text, style: Typo.titleSmall),
          ],
        ),
      ),
    );
  }
}
