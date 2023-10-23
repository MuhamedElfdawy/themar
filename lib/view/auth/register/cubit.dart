import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/logic/dio_helper.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/auth/confirm_pass/view.dart';
import 'package:themar/view/auth/register/state.dart';

class RegisterCubit extends Cubit<RegisterStates> {

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  String? selectedCity;

  RegisterCubit() : super(RegisterStates());

  void Register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      navigateTo(const ConfirmPass(isActive: true, phone: ''));
      final response = await DioHelper().sendData('client_register', data: {
        'fullname': nameController.text,
        'phone': phoneController.text,
        'password': passController.text,
        'password_confirmation': confirmPassController.text,
        'country_id': 1,
        'city_id': selectedCity,
      });
      if (response.isSuccess) {
        showMessage(response.message, type: MessageType.success);
        emit(RegisterSuccessState());
      } else {
        showMessage(response.message);
        emit(RegisterFiledState());
      }
    }
  }
}
