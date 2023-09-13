import 'package:flutter/material.dart';

class BusniessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B475E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 117,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 115,
                backgroundImage: NetworkImage(
                    "https://scontent.fcai19-3.fna.fbcdn.net/v/t39.30808-6/308186642_1291127591629753_4304346759345937405_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_ohc=KdyaFOEP5zwAX-rHg6I&_nc_ht=scontent.fcai19-3.fna&oh=00_AfD5TKsKO5Q-Xt11rVif8KAchyv657bSVTaCToGsfcTOEg&oe=64E629E1"),
              ),
            ),
            const Text(
              "Omar Elgmmal",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const Text(
              "Flutter Developer",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Divider(
              color: Colors.grey,
              indent: 60,
              endIndent: 60,
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                height: 65,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(
                        Icons.phone,
                        size: 32,
                        color: Color(0xFF2B475E),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: Text(
                        "(+20) 010621568",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                height: 65,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(
                        Icons.mail,
                        size: 32,
                        color: Color(0xFF2B475E),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: Text(
                        "Omar Elgmmal3",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
