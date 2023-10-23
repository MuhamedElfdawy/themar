import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:themar/core/design/app_button.dart';
import 'package:themar/core/design/app_text.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/auth/change_pass/view.dart';
import 'package:themar/view/auth/confirm_pass/cubit.dart';
import 'package:themar/view/auth/confirm_pass/state.dart';
import 'package:themar/view/auth/login/view.dart';

class ConfirmPass extends StatefulWidget {
  final bool isActive;
  final String phone;

  const ConfirmPass({super.key, required this.isActive, required this.phone});

  @override
  State<ConfirmPass> createState() => _ConfirmPassState();
}

class _ConfirmPassState extends State<ConfirmPass> {
  bool timerIsFinshed = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmPassCubit(),
      child: Builder(builder: (context) {
        ConfirmPassCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                child: Image.asset(
                  'asset/image/png/splash.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SafeArea(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                      widget.isActive ? 'نسيت كلمة المرور' : 'تفعيل الحساب',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    const Text(
                      'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff707070)),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.phone,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff707070)),
                          textDirection: TextDirection.ltr,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'تغيير رقم الجوال',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PinCodeTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل كود التأكيد';
                        }
                        return null;
                      },
                      appContext: context,
                      length: 4,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 60,
                        fieldWidth: 70.75,
                        selectedColor: Theme.of(context).primaryColor,
                        inactiveColor: const Color(0xffF3F3F3),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        return AppButton(
                          isLoading: state is ConfirmPassLoadingState,
                          onPressed: () {
                           cubit.verify(isActive: false, phone: widget.phone);
                          },
                          text: 'تأكيد الكود',
                          paddingButton: 27,
                        );
                      },
                    ),
                    const Text(
                      'لم تستلم الكود ؟',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff707070)),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'يمكنك إعادة إرسال الكود بعد',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff707070)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    if (!timerIsFinshed)
                      CircularCountDownTimer(
                        duration: 5,
                        initialDuration: 0,
                        width: 66.03,
                        height: 69.45,
                        ringColor: Theme.of(context).primaryColor,
                        fillColor: const Color(0xffD8D8D8),
                        strokeWidth: 3,
                        strokeCap: StrokeCap.round,
                        textStyle: TextStyle(
                            fontSize: 21,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                        textFormat: CountdownTextFormat.MM_SS,
                        onComplete: () {
                          timerIsFinshed = true;
                          setState(() {});
                        },
                      ),
                    if (timerIsFinshed)
                      Center(
                        child: OutlinedButton(
                          onPressed: () {
                            timerIsFinshed = false;
                            setState(() {});
                          },
                          child: const Text(
                            'إعادة الإرسال',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 45,
                    ),
                    const BottomText(),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
