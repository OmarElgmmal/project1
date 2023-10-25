import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/shared/logic/cache_helper.dart';
import 'package:project1/shared/logic/helper_methods.dart';
import 'features/categories/cubit.dart';
import 'features/get_cities/cubit.dart';
import 'features/products/cubit.dart';
import 'features/slider/cubit.dart';
import 'firebase_options.dart';
import 'views/login_screen_animation/view.dart';


void main() async {
 /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); */
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: getMaterialColor(),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SliderCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => GetCitiesCubit()..getData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375,812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: getMaterialColor(),
              ),
            ),
            primarySwatch: getMaterialColor(),
            scaffoldBackgroundColor: Colors.white,
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(15),
                ),
                fixedSize: const Size.fromHeight(60),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                side: BorderSide(
                  color: getMaterialColor(),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xffF3F3F3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xffF3F3F3)),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          home: child,
        ),
        child: const LoginScreenAnimation(),
      ),
    );
  }
}


MaterialColor getMaterialColor() {
  Color color = const Color(0xff4C8613);
  return MaterialColor(color.value, {
    50: color.withOpacity(.1),
    100: color.withOpacity(.2),
    200: color.withOpacity(.3),
    300: color.withOpacity(.4),
    400: color.withOpacity(.5),
    500: color.withOpacity(.6),
    600: color.withOpacity(.7),
    700: color.withOpacity(.8),
    800: color.withOpacity(.9),
    900: color,
  });
}
