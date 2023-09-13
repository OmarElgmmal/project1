import 'package:flutter/material.dart';
import 'package:project1/models/tune_model.dart';

class TuneView extends StatelessWidget {
  const TuneView({super.key});

  final List<TuneModel1> tunes = const [
    TuneModel1(color: Color(0xffFE4039), sound: "audio/note1.wav"),
    TuneModel1(color: Color(0xffFD982B), sound: "audio/note2.wav"),
    TuneModel1(color: Color(0xffFDEB57), sound: "audio/note3.wav"),
    TuneModel1(color: Color(0xff33AF57), sound: "audio/note4.wav"),
    TuneModel1(color: Color(0xff009587), sound: "audio/note5.wav"),
    TuneModel1(color: Color(0xff0097ED), sound: "audio/note6.wav"),
    TuneModel1(color: Color(0xff702179), sound: "audio/note7.wav"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff243139),
        title: const Text("Flutter Tune"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: tunes
            .map(
              (e) => TuneItem(
                tune: e,
              ),
            )
            .toList(),
      ),
    );
  }
}

class TuneItem extends StatelessWidget {
  const TuneItem({super.key, required this.tune});

  final TuneModel1 tune;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          tune.playSound();
        },
        child: Container(
          color: tune.color,
        ),
      ),
    );
  }
}
