import 'package:themar/features/categories/model.dart';

class CategoryStates {}

class CategoryLoadingState extends CategoryStates
{}
class CategoryFailedState extends CategoryStates
{
  final String msg;
  CategoryFailedState({required this.msg});
}
class CategorySuccessState extends CategoryStates
{
  final List<CategoryModel> list;
  CategorySuccessState({required this.list});
}