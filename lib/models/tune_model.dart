import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TuneModel1 {
  final Color color;
  final String sound;

 const TuneModel1({required this.color,required this.sound});

 playSound(){
    final player = AudioPlayer();
    player.play(AssetSource(sound));

  }


}