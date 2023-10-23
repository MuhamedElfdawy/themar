import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/logic/dio_helper.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/auth/login/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  final DioHelper dio = DioHelper();
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  LoginCubit() : super(LoginStates());

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final response = await DioHelper().sendData('login', data: {
        'phone': phoneController.text,
        'password': passwordController.text,
        'type': Platform.operatingSystem,
        'device_token': 'test',
        'user_type': 'client',
      });
      if (response.isSuccess) {
        showMessage(response.message, type: MessageType.success);
        emit(LoginSuccessState());
      } else {
        showMessage(response.message);
        emit(LoginFiledState());
      }
    }
  }
}
