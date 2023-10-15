import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class FavesPage extends StatefulWidget {
  const FavesPage({super.key});

  @override
  State<FavesPage> createState() => _FavesPageState();
}

class _FavesPageState extends State<FavesPage> {
  @override
  void initState() {
    super.initState();
    play();
    player.onPlayerStateChanged.listen(
      (event) {
        print(
          "*********************************",
        );
        print(player.state);
      },
    );
  }

  final player = AudioPlayer();

  Future<void> play() async {
    await player.play(
      UrlSource(
        "https://server12.mp3quran.net/maher/010.mp3",
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: StreamBuilder<PlayerState>(
        builder: (context, snapshot) {
          if (snapshot.data == PlayerState.playing) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    player.pause();
                  },
                  icon: const Icon(
                    Icons.pause,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    player.stop();
                  },
                  icon: const Icon(
                    Icons.stop,
                  ),
                ),
              ],
            );
          } else if (snapshot.data == PlayerState.paused) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    player.resume();
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    player.stop();
                  },
                  icon: const Icon(
                    Icons.stop,
                  ),
                ),
              ],
            );
          } else {
            return IconButton(
              onPressed: () {
                play();
              },
              icon: const Icon(
                Icons.play_arrow,
              ),
            );
          }
        },
        stream: player.onPlayerStateChanged,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                player.stop();
              },
              child: const Text(
                "Close",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
