import 'package:flutter/material.dart';

import 'controller.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final nameController = TextEditingController();

  bool isPasswordHidden = true;

  bool isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(16),
          children: [
            Image.network(
              "https://www.aleqt.com/sites/default/files/styles/scale_660/public/rbitem/2022/05/25/1920046-567063107.jpeg?itok=-FS6FuDk",
              height: 50,
            ),
            const Text(
              "Register",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Enter Your Personal Information",
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Fullname",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Enter your name",
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Phone",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: "Enter your phone",
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Password",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 7,
              ),
              child: TextField(
                controller: passwordController,
                obscureText: isPasswordHidden,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Enter password",
                  fillColor: Colors.grey[200],
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      isPasswordHidden = !isPasswordHidden;
                      print(isPasswordHidden);
                      setState(() {});
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Confirm Password",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 7,
              ),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: isConfirmPasswordHidden,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Enter confirm password",
                  fillColor: Colors.grey[200],
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      isConfirmPasswordHidden = !isConfirmPasswordHidden;
                      print(isConfirmPasswordHidden);
                      setState(() {});
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () async {
                final controller = RegisterController();
                String? message = await controller.sentData(
                    phoneController.text,
                    passwordController.text,
                    confirmPasswordController.text);


                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "$message"
                    ),
                  ),
                );
              },
              child: const Text(
                "Register",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
