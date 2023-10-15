import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:project1/shared/logic/cache_helper.dart';
import 'package:project1/views/home/view.dart';
import '../../../shared/logic/helper_methods.dart';
import '../thimar_login/view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      toGetNavigate(
        CacheHelper.isAuth()? const HomeView():const ThimarLogin(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Group 1.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
            color: const Color(0xff4C8613).withOpacity(.1),
          ),
          Center(
              child: FadeInDownBig(
            child: Image.asset(
              "assets/images/logo.png",
              height: 160,
              width: 160,
            ),
          )),
          Positioned(
              bottom: -100,
              right: -130,
              child: Image.asset(
                "assets/images/top-view-assortment-vegetables-paper-bag.png",
                width: 410,
                height: 404,
              ))
        ],
      ),
    );
  }
}
