import 'package:flutter/material.dart';

class PointsCounter extends StatefulWidget {
  const PointsCounter({super.key});

  @override
  State<PointsCounter> createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
  int pointCountsA = 0;

  int pointCountsB = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Points Counter"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      "Team A",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$pointCountsA",
                      style: const TextStyle(
                        fontSize: 150,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        pointCountsA++;
                        setState(() {});
                      },
                      child: const Text(
                        "Add 1 Point",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        pointCountsA += 2;
                        setState(() {});
                      },
                      child: const Text(
                        "Add 2 Point",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        pointCountsA += 3;
                        setState(() {});
                      },
                      child: const Text(
                        "Add 3 Point",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Column(
                  children: [
                    const Text(
                      "Team B",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$pointCountsB",
                      style: const TextStyle(
                        fontSize: 150,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        pointCountsB++;
                        setState(() {});
                      },
                      child: const Text(
                        "Add 1 Point",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        pointCountsB += 2;
                        setState(() {});
                      },
                      child: const Text(
                        "Add 2 Point",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        pointCountsB += 3;
                        setState(() {});
                      },
                      child: const Text(
                        "Add 3 Point",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                fixedSize: const Size(160, 40),
              ),
              onPressed: () {
                pointCountsA = 0;
                pointCountsB = 0;
                setState(() {});
              },
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

