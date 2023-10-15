import 'package:flutter/material.dart';
import 'package:project1/shared/logic/cache_helper.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {

  int count = CacheHelper.getCount();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                count++;
                CacheHelper.setCount(count);
                setState(() {

                });
              },
              child: const Icon(Icons.add),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                "$count",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                if(count>1)
                {
                  count--;
                }
                CacheHelper.setCount(count);
                setState(() {

                });
              },
              child: const Icon(Icons.minimize),
            ),
          ],
        ),
      ),
    );
  }
}
