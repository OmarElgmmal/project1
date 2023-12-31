import 'package:flutter/material.dart';
import 'package:project1/models/cities.dart';
import 'package:project1/shared/design/app_button.dart';
import 'package:project1/shared/logic/dio_helper.dart';
import 'package:project1/shared/logic/helper_methods.dart';
import 'package:project1/views/auth/confirm_code/view.dart';
import 'package:project1/views/sheets/cities.dart';
import '../../../shared/design/app_input.dart';

class RegisterViews extends StatefulWidget {
  const RegisterViews({super.key});

  @override
  State<RegisterViews> createState() => _RegisterViewsState();
}

class _RegisterViewsState extends State<RegisterViews> {
  CityModel? selectedCity;
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;

  void register() async {
    isLoading = true;
    setState(() {});
    final response = await DioHelper().sendData("client_register", data: {
      "fullname": fullNameController.text,
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text,
      "phone": phoneController.text,
      "country_id": 1,
      "city_id": selectedCity!.id,
    });
    if (response.isSuccess) {
      showMessage(response.message, type: MessageType.success);
      toGetNavigate(
        ConfirmCode(
          isActive: true,
          phone: phoneController.text,
        ),
      );
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
              child: Form(
                key: formKey,
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
                      "يمكنك تسجيل حساب جديد الأن",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    AppInput(
                      labelText: "اسم المستخدم",
                      controller: fullNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "User name must be at less 3 digits";
                        }
                        return null;
                      },
                      icon: "assets/icons/user.png",
                      paddingTop: 22,
                    ),
                    AppInput(
                      labelText: "رقم الجوال",
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "رقم الهاتف مطلوب";
                        } else if (value.length < 11) {
                          return "يجب ان يكون رقم الهاتف 11 رقم";
                        }
                        return null;
                      },
                      icon: "assets/icons/phone.png",
                      isPhone: true,
                    ),
                    StatefulBuilder(
                      builder: (context, setState) => GestureDetector(
                        onTap: () async {
                          var result = await showModalBottomSheet(
                            context: context,
                            builder: (context) => const CitiesSheet(),
                          );
                          if (result != null) {
                            selectedCity = result;
                            setState(() {});
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AbsorbPointer(
                                absorbing: true,
                                child: AppInput(
                                  labelText: selectedCity?.name ?? "المدينة",
                                  validator: (value) {
                                    if (selectedCity == null) {
                                      return "You must select your city";
                                    }
                                    return null;
                                  },
                                  icon: "assets/icons/city.png",
                                ),
                              ),
                            ),
                            if (selectedCity != null)
                              IconButton(
                                onPressed: () {
                                  selectedCity = null;
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  size: 24,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    AppInput(
                      labelText: "كلمة المرور",
                      controller: passwordController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "ادخل كلمه المرور";
                        } else if (value.toString().length < 8) {
                          return "كلمه المرور ضعيفه";
                        }
                        return null;
                      },
                      icon: "assets/icons/password.png",
                      isPassword: true,
                    ),
                    AppInput(
                      labelText: "كلمة المرور",
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "تاكيد كلمه المرور";
                        } else if (value != passwordController.text) {
                          return "كلمه المرور غير متطابقه";
                        }
                        return null;
                      },
                      icon: "assets/icons/password.png",
                      isPassword: true,
                      paddingBottom: 24,
                    ),
                    isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : AppButton(
                            text: "تسجيل",
                            onPress: () {
                              if (formKey.currentState!.validate()) {}
                            },
                          ),
                    const SizedBox(
                      height: 44,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ليس لديك حساب بالفعل ؟",
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
          ),
        ],
      ),
    );
  }
}
