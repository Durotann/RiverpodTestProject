import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/models/auth_screen_model/auth_screen_model.dart';
import 'package:riverpodproject/providers/auth_screen_provider/auth_screen_provider.dart';
import 'package:riverpodproject/theme/theme.dart';
import 'package:riverpodproject/theme/widgets/custom_button.dart';
import 'package:riverpodproject/view/auth_screen/widgets/appbar_widget.dart';
import 'package:riverpodproject/view/auth_screen/widgets/phone_field.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  late final TextEditingController phoneNumberController;
  @override
  void initState() {
    phoneNumberController = TextEditingController(text: '+7');
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Отслеживаем изменение состояния
    ref.listen(authScreenProviderProvider, (previous, next) {
      if (next.status == AuthScreenEnum.phoneSend) {
        // Если код отправлен — переходим на экран ввода кода
        print("gau");
      }
    });
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomButton(
          color: Colors.red,
          isLoading: false,
          onPressed: () {
            if (phoneNumberController.text.isNotEmpty) {
              String digitsOnly = phoneNumberController.text
                  .replaceFirst('+7', '')
                  .replaceAll(RegExp(r'[^0-9]'), '');
              ref
                  .read(authScreenProviderProvider.notifier)
                  .phoneSend(digitsOnly);
            }
          },
          title: 'Получить код',
          isActive: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(66),
        child: AppbarWidget(
          title: 'Авторизация',
          backButton: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Введите ваш номер телефона, на\nнего придёт код подтверждения ',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 40),
            PhoneField(
              phoneNumberController: phoneNumberController,
            ),
          ],
        ),
      ),
    );
  }
}
