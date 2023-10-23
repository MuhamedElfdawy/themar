import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/design/app_button.dart';
import 'package:themar/core/design/app_input.dart';
import 'package:themar/core/design/app_text.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/auth/confirm_phone/view.dart';
import 'package:themar/view/auth/login/cubit.dart';
import 'package:themar/view/auth/login/state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        LoginCubit cubit = BlocProvider.of(context);
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
                  key: cubit.formKey,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
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
                        'مرحبا بك مرة أخرى',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'يمكنك تسجيل الدخول الأن',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff707070)),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      AppInput(
                        controller: cubit.phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'حقل الهاتف مطلوب';
                          } else if (value.length < 11) {
                            return 'بيجب ان يكون رقم الهاتف اكبر من 11 رقم';
                          } else {
                            return null;
                          }
                        },
                        hintText: 'رقم الجوال',
                        prefixIcon: 'asset/icon/png/Phone.png',
                        isPhone: true,
                      ),
                      AppInput(
                        controller: cubit.passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'حقل كلمة المرور مطلوب';
                          } else if (value.length < 8) {
                            return 'كلمة المرور ضعيفة';
                          }
                          return null;
                        },
                        hintText: 'كلمة المرور',
                        prefixIcon: 'asset/icon/png/Unlock.png',
                        isPassword: true,
                        paddingButtom: 9,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                            onPressed: () {
                              navigateTo(ConfirmPhone());
                            },
                            child: const Text(
                              'نسيت كلمة المرور ؟',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff707070),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) => AppButton(
                          onPressed: () {
                            cubit.login();
                          },
                          isLoading: state is LoginLoadingState,
                          text: 'تسجيل الدخول',
                          paddingButton: 45,
                        ),
                      ),
                      const BottomText(isLogin: true),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
