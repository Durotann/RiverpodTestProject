// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.inputFormatters,
    required this.onChanged,
    required this.prefixIcon,
    required this.keyboardType,
    required this.validator,
    this.readOnly = false,
    this.hintText = '',
    this.bottomBorder = 14,
    this.fontSize = 18,
    this.isSearching = false,
    this.onTap,
    required this.focusNode,
    required this.isValid,
    this.maxLength = 50,
    this.autoFocus = false,
  });
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool readOnly;
  final String hintText;
  final FocusNode? focusNode;
  final bool isValid;
  final Function()? onTap;
  final double bottomBorder;
  final bool isSearching;
  final double fontSize;
  final int maxLength;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      autocorrect: false,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      textAlignVertical: TextAlignVertical.center,
      readOnly: readOnly,
      maxLines: 1,
      focusNode: focusNode,
      onTap: onTap,
      autofocus: autoFocus,
      style: !readOnly
          ? isValid
              ? theme.textTheme.displaySmall?.copyWith(
                  fontSize: fontSize, color: theme.colorScheme.onSurface)
              : theme.textTheme.displaySmall?.copyWith(
                  color: theme.colorScheme.onError,
                )
          : theme.textTheme.displaySmall?.copyWith(
              color: const Color.fromRGBO(156, 163, 176, 1),
            ),
      decoration: InputDecoration(
        hintStyle: theme.textTheme.displaySmall
            ?.copyWith(color: theme.colorScheme.secondary),
        counterText: '',
        hintText: hintText,
        isDense: true,
        contentPadding: prefixIcon != null
            ? const EdgeInsets.only(left: 0, right: 16, bottom: 16, top: 16)
            : const EdgeInsets.all(16),
        errorText: !isValid ? "Номер введен не корректно" : "",
        errorStyle: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 0,
          color: theme.colorScheme.onError,
        ),
        filled: true,
        fillColor: isValid ? Colors.white : theme.colorScheme.error,
        border: !isSearching
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              )
            : const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                borderSide: BorderSide.none,
              ),
        focusedBorder: !isSearching
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              )
            : const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                borderSide: BorderSide.none,
              ),
        enabledBorder: !isSearching
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              )
            : const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                borderSide: BorderSide.none,
              ),
        errorBorder: !isSearching
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              )
            : const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                borderSide: BorderSide.none,
              ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 14,
                  left: 16,
                  right: 12,
                  bottom: 14,
                ),
                child: prefixIcon,
              )
            : null,
      ),
      inputFormatters: inputFormatters,
    );
  }
}
