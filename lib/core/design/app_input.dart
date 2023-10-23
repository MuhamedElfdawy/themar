import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String hintText, prefixIcon;
  final bool isPhone, isPassword, isEnabled,isLoading;
  final double paddingButtom;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final Color? color;

  const AppInput({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPhone = false,
    this.isPassword = false,
    this.paddingButtom = 16,
    this.validator,
    this.isEnabled = true,
    this.controller,
    this.isLoading = true,
    this.color ,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isVisibilityPass = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingButtom,
      ),
      child: TextFormField(
        controller: widget.controller,
        enabled: widget.isEnabled,
        validator: widget.validator,
        obscureText: isVisibilityPass && widget.isPassword,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.color,
          icon: widget.isPhone
              ? Container(
            height: 60,
            width: 69,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color:const Color(0xffFFFFFF))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/image/png/sa.png',
                  height: 20,
                  width: 32,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '966+',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
          )
              : null,
          prefixIcon: Image.asset(widget.prefixIcon),
          suffixIcon: widget.isPassword
              ? IconButton(
            onPressed: () {
              isVisibilityPass = !isVisibilityPass;
              setState(() {});
            },
            icon: Icon(isVisibilityPass
                ? Icons.visibility_off
                : Icons.visibility),
          )
              : null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
