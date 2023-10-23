import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/core/logic/dio_helper.dart';
import 'package:themar/features/products/model.dart';
import 'package:themar/features/products/state.dart';

class ProductCubit extends Cubit<ProductStates>
{
  ProductCubit() : super(ProductStates());
  Future<void> getProductData() async{
    emit(ProductLoadingState());
    final response = await DioHelper().getData('categories/1');
    if(response.isSuccess){
      final model = ProductsData.fromJson(response.response!.data);
      emit(ProductSuccessState(list: model.list));
    }else {
      emit(ProductFailedState(msg: 'Failed'));
    }
  }
}