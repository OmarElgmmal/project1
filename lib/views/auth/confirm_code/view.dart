import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project1/shared/design/app_button.dart';
import 'package:project1/views/auth/confirm_code/cubit.dart';
import 'package:project1/views/auth/confirm_code/states.dart';



class ConfirmCode extends StatefulWidget {
  final bool isActive;
  final String phone;

  const ConfirmCode({super.key, required this.isActive, required this.phone});

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmCodeCubit(),
      child: Builder(
          builder: (context) {
            ConfirmCodeCubit cubit = BlocProvider.of(context);
            return Scaffold(
              body: SafeArea(
                child: ListView(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 130,
                        height: 126,
                      ),
                    ),
                    Text(
                      widget.isActive ? "تفعيل الحساب" : "نسيت كلمة المرور",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "+${widget.phone}",
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "تغيير رقم الجوال",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 60,
                        fieldWidth: 70,
                        inactiveColor: const Color(0xffF3F3F3),
                        selectedColor: Theme
                            .of(context)
                            .primaryColor,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    BlocBuilder<ConfirmCodeCubit, ConfirmCodeStates>(
                      builder: (context, state) {
                        if (state is ConfirmCodeLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else{
                          return AppButton(
                              text: "تأكيد الكود", onPress: () {
                            cubit.verify(
                              isActive: widget.isActive ,
                              phone: widget.phone,
                            );
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    const Text(
                      "لم تستلم الكود ؟\nيمكنك إعادة إرسال الكود بعد",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    cubit.isTimerFinished
                        ? const SizedBox.shrink()
                        : CircularCountDownTimer(
                      duration: 10,
                      initialDuration: 0,
                      width: 66,
                      height: 70,
                      ringColor: Theme
                          .of(context)
                          .primaryColor,
                      fillColor: const Color(0xffD8D8D8),
                      strokeWidth: 3,
                      onComplete: () {
                        cubit.isTimerFinished = true;
                        setState(() {});
                      },
                      textStyle: TextStyle(
                          fontSize: 20,
                          color: Theme
                              .of(context)
                              .primaryColor,
                          fontWeight: FontWeight.bold),
                      textFormat: CountdownTextFormat.MM_SS,
                      isReverseAnimation: true,
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    cubit.isTimerFinished
                        ? Center(
                      child: OutlinedButton(
                        onPressed: () async{
                          await cubit.resend(
                            phone: widget.phone
                          );
                          cubit.isTimerFinished = false;
                          setState(() {});
                        },
                        child: const Text(
                          "إعادة الإرسال",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لديك حساب بالفعل ؟",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                        ),
                        Text(
                          " تسجيل الدخول",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
