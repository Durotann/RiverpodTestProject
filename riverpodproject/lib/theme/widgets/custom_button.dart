// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:riverpodproject/theme/theme.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.width,
    required this.title,
    required this.isActive,
    this.prefixIcon,
    this.isLoading,
    this.isWorking = false,
    this.isOrderButton = false,
    this.color,
  });
  final Function()? onPressed;
  final double? width;
  final String title;
  final bool isActive;
  final bool isWorking;
  final String? prefixIcon;
  final bool? isLoading;
  final bool isOrderButton;
  final Color? color;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: widget.width,
      height: 52,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          // overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          shadowColor: const WidgetStatePropertyAll(
            Colors.transparent,
          ),
          elevation: const WidgetStatePropertyAll(0),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.black),
          backgroundColor: widget.color == null
              ? widget.isActive
                  ? widget.isWorking
                      ? WidgetStatePropertyAll(theme.colorScheme.onSurface)
                      : theme.elevatedButtonTheme.style?.backgroundColor
                  : WidgetStatePropertyAll(theme.disabledColor)
              : WidgetStatePropertyAll(widget.color),
        ),
        onPressed: () {
          if (widget.isActive) {
            if (widget.isOrderButton) {
              if (widget.isActive) {
                setState(
                  () {
                    isLoading = true;
                  },
                );
                if (widget.onPressed != null) widget.onPressed!();
              }
            } else {
              if (widget.onPressed != null) widget.onPressed!();
            }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.prefixIcon != null) SvgPicture.asset(widget.prefixIcon!),
            if (widget.prefixIcon != null) const SizedBox(width: 8),
            checkStatusLoading()
          ],
        ),
      ),
    );
  }

  Widget checkStatusLoading() {
    switch (widget.isLoading) {
      case null:
        if (isLoading) {
          return const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1,
          );
        } else {
          return Text(
            widget.title,
            style: theme.primaryTextTheme.labelMedium!.copyWith(
                color: widget.isActive
                    ? Colors.white
                    : const Color.fromRGBO(245, 248, 250, 1)),
          );
        }
      case true:
        return const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1,
        );
      case false:
        return Text(
          widget.title,
          style: theme.primaryTextTheme.labelMedium!.copyWith(
              color: widget.isActive
                  ? Colors.white
                  : const Color.fromRGBO(245, 248, 250, 1)),
        );
    }
  }
}
