import 'package:flutter/material.dart';
import 'package:project1/shared/design/app_button.dart';
import 'package:project1/shared/design/app_input.dart';

class ThimarForgetPassword extends StatefulWidget {
  const ThimarForgetPassword({super.key});

  @override
  State<ThimarForgetPassword> createState() => _ThimarForgetPasswordState();
}

class _ThimarForgetPasswordState extends State<ThimarForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding:
                const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 16),
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 130,
                  height: 126,
                ),
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
                height: 10,
              ),
              const Text(
                "أدخل كلمة المرور الجديدة",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              AppInput(
                labelText: "كلمة المرور",
                controller: passwordController,
                icon: "assets/icons/password.png",
                isPassword: true,
                validator: (value) {
                  if(value.toString().isEmpty)
                    {
                      return "ادخل كلمه المرور";
                    } else if (value.toString().length<8)
                      {
                        return "كلمه المرور ضعيفه";
                      }
                  return null;
                },
              ),
              AppInput(
                labelText: "كلمة المرور",
                controller: confirmPasswordController,
                icon: "assets/icons/password.png",
                isPassword: true,
                validator: (value) {
                  if(value.toString().isEmpty)
                  {
                    return "تاكيد كلمه المرور";
                  } else if (value !=passwordController.text)
                  {
                    return "كلمه المرور غير متطابقه";
                  }
                  return null;
                },
              ),
              AppButton(text: "تغيير كلمة المرور", onPress: () {
                if(formKey.currentState!.validate())
                  {

                  }
              }),
              const SizedBox(
                height: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لديك حساب بالفعل ؟",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
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
    );
  }
}
