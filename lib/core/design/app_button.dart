import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final String text ;
  final double paddingButton;
  final bool isLoading;
  const AppButton({super.key, required this.onPressed, required this.text, required this.paddingButton, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        bottom: paddingButton,
      ),
      child: isLoading!
          ? const Center(child: CircularProgressIndicator())
      : FilledButton(
        onPressed: onPressed,
        child: Text(
          text,
          style:  TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );

  }
}
