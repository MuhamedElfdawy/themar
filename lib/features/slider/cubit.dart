import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/logic/dio_helper.dart';
import 'package:themar/features/slider/model.dart';
import 'package:themar/features/slider/state.dart';

class SliderCubit extends Cubit<SliderStates>
{
  SliderCubit() : super(SliderStates());

  Future<void> getSliderImages() async {
    emit(SliderLoadingState());
    final response = await DioHelper().getData('sliders');
    if(response.isSuccess){
      final model = SliderData.fromJson(response.response!.data);
      emit(SliderSuccessState(list: model.list));
    }else {
      emit(SliderFailedState(msg: response.message));
    }
  }
}