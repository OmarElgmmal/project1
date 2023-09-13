import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project1/shared/design/app_button.dart';
import 'package:project1/shared/design/app_input.dart';
import 'package:project1/shared/logic/dio_helper.dart';
import 'package:project1/shared/logic/helper_methods.dart';

import '../thimar_forgetpassword/view.dart';

class ThimarLogin extends StatefulWidget {
  const ThimarLogin({super.key});

  @override
  State<ThimarLogin> createState() => _ThimarLoginState();
}

class _ThimarLoginState extends State<ThimarLogin> {
  bool isPasswordHidden = true;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    isLoading = true;
    setState(() {});
    final response = await DioHelper().sendData(
      "login",
      data: {
        "phone": phoneController,
        "password": passwordController,
        "type": Platform.operatingSystem,
        "device_token": "test",
        "user_type": "client",
      },
    );
    if (response.isSuccess) {
      showMessage(response.message, type: MessageType.success);
    } else {
      showMessage(response.message);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/Group 1.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
            color: const Color(0xff4C8613).withOpacity(.2),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 125,
                      width: 130,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "مرحبا بك مرة أخرى",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "يمكنك تسجيل الدخول الأن",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppInput(
                          labelText: "رقم الجوال",
                          controller: phoneController,
                          icon: "assets/icons/phone.png",
                          paddingTop: 27,
                          isPhone: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "رقم الهاتف مطلوب";
                            } else if (value.length < 11) {
                              return "يجب ان يكون رقم الهاتف 11 رقم";
                            }
                            return null;
                          },
                        ),
                        AppInput(
                          labelText: "كلمه المرور",
                          controller: passwordController,
                          icon: "assets/icons/password.png",
                          paddingBottom: 21,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "كلمه المرور مطلوبه";
                            } else if (value.length < 8) {
                              return "كلمه المرور ضعيفه";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toGetNavigate(
                        const ThimarForgetPassword(),
                      );
                    },
                    child: const Text(
                      textAlign: TextAlign.end,
                      "نسيت كلمة المرور ؟",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : AppButton(
                          text: "تسجيل الدخول",
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              login();
                            }
                          },
                        ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ليس لديك حساب؟",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "تسجيل الأن",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
