import 'package:flutter/material.dart';

class MonthView extends StatefulWidget {
  const MonthView({super.key});

  @override
  State<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {

  final monthController = TextEditingController();
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: monthController,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Result: ${result}",
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () {
                print(monthController.text);
                int number = int.tryParse(monthController.text) ?? 0;
                List<String> list = ["Jan", "Feb", "Marc", "April","May","June","July","August","September","October","November","December"];
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
              child: const Text(
                "Get",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
