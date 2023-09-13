import 'package:flutter/material.dart';

class BirthDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFD2BCD5),
      body: Center(
        child: Image(
          image: AssetImage(
            "images/birthday_card.png",
          ),
        ),
      ),
    );
  }
}
