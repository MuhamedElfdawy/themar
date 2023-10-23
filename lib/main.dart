import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themar/core/logic/helper_methods.dart';
import 'package:themar/view/address/view.dart';
import 'package:themar/view/counter/view.dart';
import 'package:themar/view/home/view.dart';
import 'package:themar/view/splash/view.dart';
import 'features/categories/cubit.dart';
import 'features/products/cubit.dart';
import 'features/slider/cubit.dart';
import 'firebase_options.dart';

 late final SharedPreferences prefs;

 void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   prefs = await SharedPreferences.getInstance();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: getMyMaterialColor(),
  ));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SliderCubit()..getSliderImages(),
        ),
        BlocProvider(
          create: (BuildContext context) => CategoryCubit()..getCategoryImage(),
        ),
        BlocProvider(
          create: (BuildContext context) => ProductCubit()..getProductData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0,
                centerTitle: true,
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: getMyMaterialColor(),
                ),
            ),
            backgroundColor: Colors.white,
            primarySwatch: getMyMaterialColor(),
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              side: const BorderSide(color: Color(0xff4C8613)),
              fixedSize: const Size(133, 47),
            )),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: const Size.fromHeight(60),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffFFFFFF))),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffFFFFFF))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffFFFFFF))),
            ),
          ),
          home: child,
        ),
        child: CounterView(),
      ),
    );
  }
}

getMyMaterialColor() {
  Color color = const Color(0xff4C8613);
  return MaterialColor(color.value, {
    50: color.withOpacity(0.1),
    100: color.withOpacity(0.2),
    200: color.withOpacity(0.3),
    300: color.withOpacity(0.4),
    400: color.withOpacity(0.5),
    500: color.withOpacity(0.6),
    600: color.withOpacity(0.7),
    700: color.withOpacity(0.8),
    800: color.withOpacity(0.9),
    900: color,
  });
}
