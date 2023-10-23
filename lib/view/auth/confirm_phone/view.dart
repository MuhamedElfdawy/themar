import 'package:flutter/material.dart';
import 'package:themar/core/design/app_button.dart';
import 'package:themar/core/design/app_input.dart';
import 'package:themar/core/design/app_text.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/auth/confirm_pass/view.dart';


class ConfirmPhone extends StatefulWidget {
  const ConfirmPhone({super.key});

  @override
  State<ConfirmPhone> createState() => _LoginState();
}

class _LoginState extends State<ConfirmPhone> {
  final formKey = GlobalKey<FormState>();
  final confirmPhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'asset/image/png/splash.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          body: SafeArea(
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                children: [
                  Center(
                    child: Image.asset(
                      'asset/image/png/logo.png',
                      height: 125,
                      width: 130,
                      fit: BoxFit.fill,
                    ),
                  ),
                   const SizedBox(
                    height: 21,
                  ),
                  Text(
                    'نسيت كلمة المرور',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                   const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'أدخل رقم الجوال المرتبط بحسابك',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff707070)),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Form(
                    key: formKey,
                    child: AppInput(
                      controller: confirmPhoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'حقل الهاتف مطلوب';
                        } else if (value.length < 11) {
                          return 'يجب ان يكون رقم الهاتف 11 رقم';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'رقم الجوال',
                      prefixIcon: 'asset/icon/png/Phone.png',
                      isPhone: true,
                    ),
                  ),
                  AppButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        navigateTo(ConfirmPass(isActive: false, phone: confirmPhoneController.text));
                      }
                    },
                    text: 'تأكيد رقم الجوال',
                    paddingButton: 45,
                  ),
                  BottomText(),
                ]),
          ),
        ),
      ],
    );
  }
}
