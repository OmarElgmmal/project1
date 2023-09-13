import 'package:flutter/material.dart';

class MonthView extends StatefulWidget {
  const MonthView({super.key});

  @override
  State<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  late String result;
  final monthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: monthController,
            ),
            const SizedBox(
              height: 15,
            ),
            FilledButton(
              onPressed: () {
                print(monthController.text);
                int number = int.tryParse(monthController.text) ?? 0;
                List<String> list = ["jan", "feb", "mars", "april"];
                result = list[number - 1];
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      list[number - 1],
                    ),
                  ),
                );
              },
              child:const Text(
                "Get",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
