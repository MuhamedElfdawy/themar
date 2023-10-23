import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/design/app_image.dart';
import '../../../features/categories/cubit.dart';
import '../../../features/categories/state.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
          create: (BuildContext context) => CategoryCubit()..getCategoryImage(),
        child: Scaffold(
          body: Column(
            children: [BlocBuilder<CategoryCubit,CategoryStates>(
              builder:(context, state) {
                if(state is CategoryLoadingState){
                  return const Center(child: CircularProgressIndicator());
                }else if(state is CategorySuccessState){
                  return SizedBox(
                    height: 160,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'الأقسام',
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w900),),
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 73,
                                        width: 73,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(9),
                                        ),
                                        child: AppImage(state.list[index].media,
                                          height: 73,
                                          width: 73,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(state.list[index].name,)
                                    ],
                                  ),
                                ),
                              itemCount: state.list.length,
                              scrollDirection: Axis.horizontal,

                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }else {
                  return const Text('Failed');
                }
              },
            ),],
          )
        ),
      ),
    );
  }
}
/*
ListView.separated(
                              itemBuilder: (context, index) {
                                Column(
                                  children: [
                                    Container(
                                      height: 73,
                                      width: 73,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: AppImage(state.list[index].media,
                                        height: 73,
                                        width: 73,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(state.list[index].name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),)
                                  ],
                                );
                                Container(
                                  height: 73,
                                  width: 73,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: AppImage(state.list[index].media,
                                    height: 73,
                                    width: 73,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(width: 16,),
                              itemCount: 2,
                              scrollDirection: Axis.horizontal,
                            )
 */