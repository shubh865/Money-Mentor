import 'package:flutter/material.dart';

import '../../../../core/theme/palette.dart';
import '../typography.dart';
import 'theme_helper.dart';

class CustomTextField extends StatelessWidget {
  final textController;
  final String? label;
  final String? hint;
  final Widget? icon;
  final onTapIcon;
  final keyboardType;
  final validate;
  final readOnly;
  final onTap;
  final maxLines;
  final obscureText;
  final autoFocus;
  final border;

  const CustomTextField({
    super.key,
    required this.textController,
    this.label,
    this.hint,
    this.icon,
    this.onTapIcon,
    this.keyboardType,
    required this.validate,
    this.readOnly,
    this.onTap,
    this.maxLines,
    this.obscureText,
    this.autoFocus,
    this.border,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: Typo.titleSmall.copyWith(
        color: Theme.of(context).brightness == Brightness.light ? Palette.black : Palette.white,
      ),
      validator: validate,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      autofocus: autoFocus ?? false,
      decoration: ThemeHelper(context: context).textInputDecoration(
        label ?? "",
        hint ?? "",
        icon,
        onTapIcon,
      ),
    );
  }
}

class CustomRoundedTextField extends StatelessWidget {
  final textController;
  final String? label;
  final String? hint;
  final Widget? icon;
  final onTapIcon;
  final keyboardType;
  final validate;
  final readOnly;
  final onTap;
  final maxLines;
  final obscureText;
  final autoFocus;

  const CustomRoundedTextField({
    super.key,
    required this.textController,
    this.label,
    this.hint,
    this.icon,
    this.onTapIcon,
    this.keyboardType,
    required this.validate,
    this.readOnly,
    this.onTap,
    this.maxLines,
    this.obscureText,
    this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: Typo.titleSmall.copyWith(
        color: Theme.of(context).brightness == Brightness.light ? Palette.black : Palette.white,
      ),
      validator: validate,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      autofocus: autoFocus ?? false,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: icon,
        suffixIcon: onTapIcon != null
            ? GestureDetector(
                onTap: onTapIcon,
                child: const Icon(Icons.search),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
