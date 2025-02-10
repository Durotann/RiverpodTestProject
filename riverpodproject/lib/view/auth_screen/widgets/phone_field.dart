import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:riverpodproject/theme/theme.dart';
import 'package:riverpodproject/theme/widgets/custom_textfield.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({super.key, required this.phoneNumberController});
  final TextEditingController phoneNumberController;
  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late MaskTextInputFormatter maskTextInputFormatter;
  late final FocusNode phoneFocus;
  @override
  void initState() {
    phoneFocus = FocusNode();
    maskTextInputFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
    );
    super.initState();
  }

  @override
  void dispose() {
    phoneFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Телефон",
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 52,
          child: CustomTextField(
            focusNode: phoneFocus,
            keyboardType: TextInputType.phone,
            isValid: true,
            controller: widget.phoneNumberController,
            inputFormatters: [maskTextInputFormatter],
            onChanged: (value) {
              if (!value.startsWith('+7')) {
                widget.phoneNumberController.text =
                    '+7${value.replaceAll('+7', '')}';
                widget.phoneNumberController.selection =
                    TextSelection.fromPosition(
                  TextPosition(
                      offset: widget.phoneNumberController.text.length),
                );
              }
            },
            prefixIcon: SvgPicture.asset(
              "images/phone.svg",
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            validator: null,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Номер введён некорректно ",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onError,
          ),
        )
      ],
    );
  }
}
