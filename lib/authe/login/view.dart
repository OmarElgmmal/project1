import 'package:flutter/material.dart';
import 'controller.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordHidden = true;
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsetsDirectional.all(16),
        children: [
          Image.network(
            "https://img.freepik.com/free-vector/access-control-system-abstract-concept_335657-3180.jpg?w=740&t=st=1695857231~exp=1695857831~hmac=55266d96295d463dc167b4b2622fba98596405dfd0a23cc6702123203999cfe1",
            height: 200,
          ),
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Login to continue using the app",
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
            "Phone",
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
                labelText: "Enter your phone",
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
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: const Align(
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                "forget password?",
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FilledButton(
            onPressed: () async{
              print(phoneController.text);
              print(passwordController.text);

              final controller = LoginViewController();
              String msg = await controller.sendData(phone: phoneController.text,password: passwordController.text);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      msg,
                    ),
                  ),
                );
            },
            child: const Text(
              "Login",
            ),
          ),
        ],
      ),
    );
  }
}
