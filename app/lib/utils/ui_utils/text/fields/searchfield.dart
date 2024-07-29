import 'package:flutter/material.dart';

import '../../../../core/theme/palette.dart';
import '../typography.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final String? label;
  final String? hint;
  final Widget? icon;
  final VoidCallback? onTapIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validate;
  final bool? readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final bool? obscureText;
  final bool? autoFocus;

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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: Typo.titleSmall.copyWith(
        color: Theme.of(context).brightness == Brightness.light
            ? Palette.black
            : Palette.white,
      ),
      validator: validate,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      autofocus: autoFocus ?? false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        labelText: label,
        hintText: hint,
        icon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

class CustomSearchField extends StatelessWidget {
  final TextEditingController textController;
  final String? hint;
  final Function(String)? onSearch;

  const CustomSearchField({
    super.key,
    required this.textController,
    this.hint,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: textController,
      hint: hint,
      validate: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a search term';
        }
        return null;
      },
      icon: const Icon(Icons.search),
      onTapIcon: () {
        if (onSearch != null) {
          onSearch!(textController.text);
        }
      },
    );
  }
}
