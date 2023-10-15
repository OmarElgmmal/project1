import 'package:flutter/material.dart';

import 'controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final passwordController = TextEditingController();

  final phoneController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.network(
              "https://www.aleqt.com/sites/default/files/styles/scale_660/public/rbitem/2022/05/25/1920046-567063107.jpeg?itok=-FS6FuDk",
              height: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Login to continue the app"),
            const SizedBox(
              height: 20,
            ),
            const Text("Phone"),
            Padding(
              padding: const EdgeInsets.only(
                top: 7,
              ),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: "Enter your phone",
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.phone),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text("Password"),
            Padding(
              padding: const EdgeInsets.only(
                top: 7,
              ),
              child: TextField(
                 controller: passwordController,
                 obscureText:isPasswordHidden ,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Enter password",
                  fillColor: Colors.grey[200],
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordHidden
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      isPasswordHidden = !isPasswordHidden;
                      print(isPasswordHidden);
                      setState(() {

                      });
                    },
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forget Password?",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: ()async {
                final controller = LoginController();
                String? message = await controller.sentData(phoneController.text,passwordController.text);


                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "$message",
                    ),
                  ),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
