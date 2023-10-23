import 'dart:core';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar/core/design/app_image.dart';
import 'package:themar/core/design/app_input.dart';
import 'package:themar/features/categories/cubit.dart';
import 'package:themar/features/categories/state.dart';
import 'package:themar/features/products/cubit.dart';
import 'package:themar/features/products/model.dart';
import 'package:themar/features/products/state.dart';
import 'package:themar/features/slider/cubit.dart';
import 'package:themar/features/slider/state.dart';

import '../../../features/categories/model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _MainAppBar(),
      body: ListView(
        children: [
           SizedBox(
            height: 21.h,
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppInput(
              color: Theme.of(context).primaryColor.withOpacity(0.05),
              hintText: 'ابحث عن ماتريد؟',
              prefixIcon: 'asset/icon/png/search.png',
              paddingButtom: 24.h,
            ),
          ),
          BlocBuilder<SliderCubit, SliderStates>(
            builder: (context, state) {
              if (state is SliderLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SliderSuccessState) {
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CarouselSlider(
                      items: List.generate(
                        state.list.length,
                        (index) => Image.network(
                          state.list[index].media,
                          height: 164.h,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      options: CarouselOptions(
                        height: 164.h,
                        autoPlay: true,
                        viewportFraction: 1.sp,
                        onPageChanged: (index, reason) {
                          currentIndex = index;
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 7.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          state.list.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 3.w),
                            child: CircleAvatar(
                              backgroundColor: index == currentIndex
                                  ? Colors.white
                                  : Colors.white.withOpacity(.50.sp),
                              radius: 5.r,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return const Text('Failed');
              }
            },
          ),
           SizedBox(
            height: 29.h,
          ),
          BlocBuilder<CategoryCubit, CategoryStates>(
            builder: (context, state) {
              if (state is CategoryLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategorySuccessState) {
                return SizedBox(
                  height: 160.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الأقسام',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) => _ItemCategory(
                              model: state.list[index],
                            ),
                            itemCount: state.list.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => SizedBox(
                              width: 16.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Text('Failed');
              }
            },
          ),
          SizedBox(
            height: 29.h,
          ),
          BlocBuilder<ProductCubit, ProductStates>(
            builder: (context, state) {
              if(state is ProductLoadingState){
                return const Center(child: CircularProgressIndicator());
              }else if(state is ProductSuccessState){
                return  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('الأصناف',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w900),),
                      SizedBox(height: 7.h,),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,


                            childAspectRatio: 150.sp / 300.sp,
                        ),
                        itemCount: state.list.length,
                        itemBuilder: (context, index) => _ItemProduct(model: state.list[index]),
                      ),
                    ],
                  ),
                );
              }else {
                return const Text('Failed');
              }
            },
          )
        ],
      ),
    );
  }
}

class _MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainAppBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SizedBox(
          height: 60.h,
          child: Row(
            children: [
              AppImage(
                'asset/image/png/logo.png',
                height: 23.h,
                width: 23.w,
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                'سلة ثمار',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Expanded(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: 'التوصيل إلى',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                      children:  [
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                            text: 'شارع الملك فهد - جدة',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ]),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 33.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.13.sp),
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                    padding: EdgeInsets.all(7.5.sp),
                    child: SvgPicture.asset('asset/icon/svg/Bag.svg'),
                  ),
                  Transform.translate(
                    offset: Offset(-2.sp, -5.sp),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.w, color: Colors.white),
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        maxRadius: 5.r,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

class _ItemCategory extends StatelessWidget {
  final CategoryModel model;

  const _ItemCategory({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 73.h,
          width: 73.w,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(.05.sp),
            borderRadius: BorderRadius.circular(9.sp),
          ),
          child: AppImage(
            model.media,
            height: 73.h,
            width: 73.w,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          model.name,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final ProductModel  model;

  const _ItemProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.sp,
      width: 150.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17)
      ),
      child: Padding(
        padding: EdgeInsets.all(9.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11.r),
                  child: AppImage(model.mainImage,
                    height: 145.h,
                    width: 166.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 20.h,
                    width: 54.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(11.r),
                        bottomRight: Radius.circular(7.r),
                      ),
                    ),
                    child: Text(
                     '${model.discount*100.toInt()}%-',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Text.rich(
              TextSpan(
                  text: model.title,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  children: [
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'السعر /1${model.unit.name}',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff808080)),
                    )
                  ]),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text.rich(
                TextSpan(
                    text: '${model.price.round()}ر.س',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                    children: [
                      const TextSpan(
                          text: '\t'
                      ),
                      TextSpan(
                        text: '${model.priceBeforeDiscount}ر.س',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.lineThrough,
                        ),
                      )
                    ]
                ),),
              Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: Theme.of(context).primaryColor,
                ),
                child: Icon(Icons.add,size: 25.sp,color: Colors.white,),
              ),
            ],),
            SizedBox(height: 5.h,),
            Center(
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)
                  )
                ),
                child: const Text('أضف للسلة',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}