import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/shared/design/app_button.dart';
import 'package:project1/shared/design/app_input.dart';
import 'package:project1/shared/logic/helper_methods.dart';
import 'package:project1/views/auth/register_thimar/view.dart';
import 'package:project1/views/auth/thimar_login/cubit.dart';
import 'package:project1/views/auth/thimar_login/states.dart';
import 'package:project1/views/auth/thimar_password/view.dart';

class ThimarLogin extends StatefulWidget {
  const ThimarLogin({super.key});

  @override
  State<ThimarLogin> createState() => _ThimarLoginState();
}

class _ThimarLoginState extends State<ThimarLogin> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        LoginCubit cubit = BlocProvider.of(context);
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
                        key: cubit.formKey,
                        child: Column(
                          children: [
                            AppInput(
                              labelText: "رقم الجوال",
                              controller: cubit.phoneController,
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
                              controller: cubit.passwordController,
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
                            const ThimarPassword(),
                          );
                        },
                        child: const Text(
                          textAlign: TextAlign.end,
                          "نسيت كلمة المرور ؟",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) {
                          if (state is LoginLoadingStates) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return AppButton(
                              text: "تسجيل الدخول",
                              onPress: () {
                                cubit.login();
                              },
                            );
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
                            onPressed: () {
                              toGetNavigate(const RegisterViews());
                            },
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
      }),
    );
  }
}
