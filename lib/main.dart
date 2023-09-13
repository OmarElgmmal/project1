import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shared/design/app_button.dart';
import 'shared/logic/helper_methods.dart';
import 'views/auth/confirm_code/view.dart';
import 'views/auth/register_thimar/view.dart';
import 'views/auth/splash/view.dart';
import 'views/auth/thimar_forgetpassword/view.dart';
import 'views/auth/thimar_login/view.dart';
import 'views/auth/thimar_password/view.dart';
import 'views/input_thimar/view.dart';
import 'views/notification/view.dart';
import 'views/tunes_player_app/tune_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: getMaterialColor(),
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const ThimarLogin(),
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
