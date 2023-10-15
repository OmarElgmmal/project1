import 'package:flutter/material.dart';

import '../login/view.dart';
import '../register/view.dart';


class LoginRegisterView extends StatelessWidget {
  const LoginRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsetsDirectional.all(16),
        children: [
          Image.network(
            "https://img.freepik.com/free-vector/privacy-policy-concept-illustration_114360-7853.jpg?w=740&t=st=1695857267~exp=1695857867~hmac=8595a7fe65037bd9cd8399d05c2cd21c658addcbb0685236b4c69d427004e89a",
          ),
          Row(
            children: [
              Image.network(
                "https://img.freepik.com/free-vector/privacy-policy-concept-illustration_114360-7853.jpg?w=740&t=st=1695857267~exp=1695857867~hmac=8595a7fe65037bd9cd8399d05c2cd21c658addcbb0685236b4c69d427004e89a",
                height: 50,
              ),
              const Text(
                "Local",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Shop",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "EverThing you Need is in one place",
            style: TextStyle(
              fontSize: 31,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Find your daily neccessities at Brand the world's largest fashion e_commerce has arrived in a mobile shop now!",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
              );
            },
            child: const Text(
              "Login",
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterView(),
                ),
              );
            },
            child: const Text(
              "Register",
            ),
          ),
        ],
      ),
    );
  }
}
