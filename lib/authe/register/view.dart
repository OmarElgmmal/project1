import 'package:flutter/material.dart';
import 'controller.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPasswordHidden = true;
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(16),
          children: [
            Image.network(
              "https://img.freepik.com/free-vector/online-registration-isometric-landing-page_107791-6190.jpg?w=996&t=st=1695865155~exp=1695865755~hmac=8566308b9271c533edd886bc49e2551868ef6c1ec1a39312553d0bc2badedc1d",
              height: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Register",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter your personal information",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Username",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: "Enter your name",
                  prefixIcon: const Icon(Icons.edit),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Email",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: "Enter your email",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: isPasswordHidden,
              decoration: InputDecoration(
                  labelText: "Enter password",
                  prefixIcon: const Icon(Icons.lock),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Confirm password",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: isPasswordHidden,
              decoration: InputDecoration(
                  labelText: "Enter confirm password",
                  prefixIcon: const Icon(Icons.lock),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () async{
                print(phoneController.text);
                print(passwordController.text);


                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Register",
                    ),
                  ),
                );
              },
              child: const Text(
                "Register",
              ),
            ),
          ],
        ),
      ),
    );
  }
}