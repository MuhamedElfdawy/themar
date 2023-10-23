import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/logic/dio_helper.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/auth/confirm_pass/state.dart';

class ConfirmPassCubit extends Cubit<ConfirmPassStates>
{
  final confirmCodController = TextEditingController();

  ConfirmPassCubit() : super(ConfirmPassStates());

  Future<void> verify({required bool isActive, required String phone}) async {
    final response = await DioHelper().sendData('verify', data: {
      'code': confirmCodController.text,
      'phone': phone,
      'type': Platform.operatingSystem,
      'device_token': 'test',
    });
    if (response.isSuccess) {
      showMessage(response.message, type: MessageType.success);
    } else {
      showMessage(response.message);
    }
  }
}

