import 'package:flutter/material.dart';

import 'controller.dart';

class LoginView extends StatefulWidget {
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
              "https://scontent.fcai19-3.fna.fbcdn.net/v/t39.30808-6/308024750_1291134051629107_1737580409615767305_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=174925&_nc_ohc=Nj2TlAvWCHcAX-a3i9R&_nc_ht=scontent.fcai19-3.fna&oh=00_AfDMTG36jJ_S-DIqypB0ifevzFc7_aYkXTkYINlOHPBXNw&oe=64E7E359",
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
