import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/logic/dio_helper.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/auth/change_pass/state.dart';

class ChangePassCubit extends Cubit<ChangePassStates>
{
  final bool isActive;
  final String phone;
  final ConfirmCodController = TextEditingController();

  void verify() async {
    final response = await DioHelper().sendData('client_register', data: {
      'code': ConfirmCodController.text,
      'phone': phone,
      'type': 1,
      'device_token': '',
    });
    if (response.isSuccess) {
      showMessage(response.message, type: MessageType.success);
    } else {
      showMessage(response.message);
    }
  }

  ChangePassCubit(this.isActive, this.phone) : super(ChangePassStates());

}