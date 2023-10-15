import 'package:flutter/material.dart';


class PlayView extends StatelessWidget {
  const PlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/media/F1BybOyXgAEgqlW?format=jpg&name=large",
                ),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 40, bottom: 5),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print("Hello");
                },
                child: Container(
                  height: 60,
                  width: 315,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff92D0FD),
                          Color(0xff9DCEFF),
                        ],
                      ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff95ADFE).withOpacity(.30),
                        offset: const Offset(0,10),
                        spreadRadius: 0,
                        blurRadius: 22,
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                  ),

                  child: const Text(
                    "Get started",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
