import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (String value) {
                print(value);
              },
              onChanged: (String value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: "Email Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPasswordHidden,
              onFieldSubmitted: (String value) {
                print(value);
              },
              onChanged: (String value) {
                print(value);
              },
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: IconButton(
                    icon:  Icon(isPasswordHidden? Icons.visibility_off : Icons.visibility),
                    onPressed: (){
                      isPasswordHidden = !isPasswordHidden;
                      print(isPasswordHidden);
                      setState(() {

                      });

                    },
                  ),
                  prefixIcon: const Icon(Icons.lock)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(emailController.text);
                  print(passwordController.text);
                },
                child: const Text(
                  "LOGIN",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Register Now",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
