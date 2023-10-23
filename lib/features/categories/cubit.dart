import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/logic/dio_helper.dart';
import 'package:themar/features/categories/model.dart';
import 'package:themar/features/categories/state.dart';

class CategoryCubit extends Cubit<CategoryStates>
{
  CategoryCubit(): super(CategoryStates());
  Future<void> getCategoryImage()async {
    emit(CategoryLoadingState());
    final response = await DioHelper().getData('categories');
    if(response.isSuccess){
      final model = CategoryData.fromJson(response.response!.data);
      emit(CategorySuccessState(list: model.list));
    }else{
      emit(CategoryFailedState(msg: 'Failed'));
    }
  }
}