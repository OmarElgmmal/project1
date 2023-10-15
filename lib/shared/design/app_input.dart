import 'package:flutter/material.dart';
import 'package:project1/shared/design/app_image.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText, icon;
  final double paddingBottom, paddingTop;
  final bool isPhone, isPassword, isEnabled;
  final FormFieldValidator<String?>? validator;

  const AppInput(
      {super.key,
      this.validator,
      this.controller,
      this.isEnabled = true,
      required this.labelText,
      required this.icon,
      this.paddingBottom = 16,
      this.paddingTop = 16,
      this.isPhone = false,
      this.isPassword = false});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: widget.paddingBottom, top: widget.paddingTop),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        enabled: widget.isEnabled,
        obscureText: isPasswordHidden && widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(isPasswordHidden
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    isPasswordHidden = !isPasswordHidden;
                    setState(() {});
                  },
                )
              : null,
          icon: widget.isPhone
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/rectangle 3454.png",
                        height: 20,
                        width: 32,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "+966",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffF3F3F3))),
                )
              : null,
          prefixIcon: AppImage(
            widget.icon,
            fit: BoxFit.scaleDown,
            height: 20,
            width: 18,
          ),
        ),
      ),
    );
  }
}
