import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/design/app_button.dart';
import 'package:themar/core/design/app_input.dart';
import 'package:themar/core/design/app_text.dart';
import 'package:themar/view/auth/register/cubit.dart';
import 'package:themar/view/auth/register/state.dart';
import 'package:themar/view/sheets/cities.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(
        builder: (context) {
          RegisterCubit cubit = BlocProvider.of(context);
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
                          'مرحبا بك مرة أخرى',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'يمكنك تسجيل الدخول الأن',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff707070)),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        AppInput(
                          controller: cubit.nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'ادخل اسمك';
                            }
                            return null;
                          },
                          hintText: 'اسم المستخدم',
                          prefixIcon: 'asset/icon/png/User.png',
                        ),
                        AppInput(
                          controller: cubit.phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'ادخل رقم الجوال';
                            } else if (value.length < 11) {
                              return 'يجب ان يكون رقم الجوال 11 رقم';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: 'asset/icon/png/Phone.png',
                          hintText: 'رقم الجوال',
                          isPhone: true,
                        ),
                        StatefulBuilder(
                          builder: (context, setState) => GestureDetector(
                            onTap: () async {
                              var result = await showModalBottomSheet(
                                  context: context,
                                  builder: (context) => CitiesSheet());
                              if (result != null) {
                                cubit.selectedCity = result;
                                setState(() {});
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: AppInput(
                                      paddingButtom: 0,
                                      hintText: cubit.selectedCity ?? 'المدينة',
                                      prefixIcon: 'asset/icon/png/city.png',
                                      validator: (value) {
                                        if (cubit.selectedCity == null) {
                                          return 'يجب اختيار المدينة';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                if (cubit.selectedCity != null)
                                  IconButton(
                                    onPressed: () {
                                      cubit.selectedCity = null;
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.clear),
                                    color: Colors.red,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppInput(
                          controller: cubit.passController,
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
                          controller: cubit.confirmPassController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'اعد كتابة كلمة المرور';
                            } else if (value.length < 8) {
                              return 'كلمة المرور ضعيفة';
                            } else if (value != cubit.passController.text) {
                              return 'كلمتين المرور غير متطابقتين';
                            }
                            return null;
                          },
                          hintText: 'كلمة المرور',
                          prefixIcon: 'asset/icon/png/Unlock.png',
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        BlocBuilder(
                          bloc: cubit,
                            builder: (context, state) => AppButton(
                              onPressed: () {
                                cubit.Register();
                              },
                              isLoading: State is RegisterLoadingState,
                              text: 'تسجيل',
                              paddingButton: 45,
                            ),
                        ),
                        const BottomText(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
