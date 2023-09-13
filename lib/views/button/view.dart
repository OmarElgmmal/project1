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
                backgroundImage:NetworkImage("https://scontent.fcai19-3.fna.fbcdn.net/v/t39.30808-6/308186642_1291127591629753_4304346759345937405_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=174925&_nc_ohc=9khie4SNxosAX-S7--O&_nc_ht=scontent.fcai19-3.fna&oh=00_AfACDKn5ziSKtvxUOuW2Wf2u9ejmHym5rwlnwZOI3wC2VQ&oe=64EE12E1",),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 27),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                  print("Hello");
                },
                child: Container(
                  height: 60,
                  width: 315,
                  alignment: AlignmentDirectional.center,
                   child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(
                        0xff92D0FD
                      ),
                        Color(0xff9DCEFF),
                    ]),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(99),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff95ADFE).withOpacity(.30),
                        blurStyle: BlurStyle.normal,
                        blurRadius: 22,
                        spreadRadius: 0,
                        offset: const Offset(0,10),
                      ),
                    ],
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
