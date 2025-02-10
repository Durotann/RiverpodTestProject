
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpodproject/theme/theme.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    required this.title,
    required this.backButton,
    this.actionButton,
    this.bottom,
    this.closeConnection,
  });
  final String title;
  final bool backButton;
  final Widget? actionButton;
  final PreferredSizeWidget? bottom;
  final void Function()? closeConnection;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      shadowColor: Colors.black,
      elevation: 4,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton
              ? GestureDetector(
                  onTap: () {
                    closeConnection?.call();
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    "images/arrow.svg",
                  ),
                )
              : const SizedBox(width: 32),
          Flexible(
            child: Text(
              title,
              style: theme.textTheme.headlineLarge
                  ?.copyWith(overflow: TextOverflow.ellipsis),
            ),
          ),
          actionButton ?? const SizedBox(width: 32),
        ],
      ),
      bottom: bottom,
    );
  }
}
