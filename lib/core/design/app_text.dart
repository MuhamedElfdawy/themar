import 'package:flutter/material.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/auth/login/view.dart';
import 'package:themar/view/auth/register/view.dart';

class BottomText extends StatelessWidget {
  final bool isLogin ;
  const BottomText({super.key,this.isLogin=false});

  @override
  Widget build(BuildContext context) {
    return isLogin? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ليس لديك حساب ؟',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor),
        ),
        TextButton(
          onPressed: () {
            navigateTo(Register());
          },
          child: Text(
            'تسجيل الأن',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w900),
          ),
        )
      ],
    ):
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لديك حساب ؟',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor),
        ),
        TextButton(
          onPressed: () {
            navigateTo(Login());
          },
          child: Text(
            'تسجيل الدخول',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w900),
          ),
        )
      ],
    )
    ;
  }
}
