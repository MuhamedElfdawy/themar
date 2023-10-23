import 'package:flutter/material.dart';
import 'package:themar/core/design/app_button.dart';
import 'package:themar/core/design/app_input.dart';
import 'package:themar/core/design/app_text.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/auth/login/view.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _LoginState();
}

class _LoginState extends State<ChangePass> {
  final formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

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
            child: Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                children: [
                  Center(
                    child: Image.asset(
                      'asset/image/png/logo.png',
                      height: 125,
                      width: 130,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Text(
                    'نسيت كلمة المرور',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'أدخل كلمة المرور الجديدة',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff707070)),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  AppInput(
                    controller: passController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل كلمة المرور';
                      } else if (value.length < 8) {
                        return 'كلمة المرور ضعيفة';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'كلمة المرور',
                    prefixIcon: 'asset/icon/png/Unlock.png',
                    isPassword: true,
                  ),
                  AppInput(
                    controller: confirmPassController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل كلمة المرور';
                      } else if (value.length < 8) {
                        return 'كلمة المرور ضعيفة';
                      } else if (value != passController.text) {
                        return 'كلمتين المرور غير متطابقتين';
                      }
                      return null;
                    },
                    hintText: 'كلمة المرور',
                    prefixIcon: 'asset/icon/png/Unlock.png',
                    isPassword: true,
                    paddingButtom: 24,
                  ),
                  AppButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          navigateTo(Login());
                        }
                      },
                      text: 'تغيير كلمة المرور',
                      paddingButton: 45),
                  BottomText(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
