import 'package:flutter/material.dart';
import 'package:project1/shared/design/app_button.dart';
import 'package:project1/shared/design/app_input.dart';
import 'package:project1/shared/logic/helper_methods.dart';
import 'package:project1/views/auth/confirm_code/view.dart';

class ThimarPassword extends StatefulWidget {
  const ThimarPassword({super.key});

  @override
  State<ThimarPassword> createState() => _ThimarPasswordState();
}

class _ThimarPasswordState extends State<ThimarPassword> {
  bool isPasswordHidden = true;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

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
                    "نسيت كلمة المرور",
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
                    "أدخل رقم الجوال المرتبط بحسابك",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: AppInput(
                      labelText: "رقم الجوال",
                      controller: phoneController,
                      icon: "assets/icons/phone.png",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "رقم الهاتف مطلوب";
                        } else if (value.length < 11) {
                          return "يجب ان يكون رقم الهاتف 11 رقم";
                        }
                        return null;
                      },
                      isPhone: true,
                      paddingTop: 27,
                    ),
                  ),
                  AppButton(
                    text: "تأكيد رقم الجوال",
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        toGetNavigate(
                          ConfirmCode(
                            isActive: false,
                            phone: phoneController.text,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 340,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "لديك حساب بالفعل ؟",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "تسجيل الدخول",
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
