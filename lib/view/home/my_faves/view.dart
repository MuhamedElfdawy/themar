import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar/core/design/app_button.dart';
import 'package:video_player/video_player.dart';

class FavesPage extends StatefulWidget {
  const FavesPage({super.key});

  @override
  State<FavesPage> createState() => _FavesPageState();
}

class _FavesPageState extends State<FavesPage> {
  late VideoPlayerController video;
  final player = AudioPlayer();

  Future<void> play() async {
    await player.play(UrlSource(
        'https://server14.mp3quran.net/islam/Rewayat-Hafs-A-n-Assem/017.mp3'));
  }

  Future<void> videosPlay() async {
    video = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'سورة الإسراء',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      content: const Text(
                        'بصوت القارئ إسلام صبحي',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                player.stop();
                              },
                              child: const Icon(Icons.stop),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                player.pause();
                              },
                              child: const Icon(Icons.pause),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                play();
                              },
                              child: const Icon(Icons.play_arrow),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                text: 'Quran',
                paddingButton: 16,
                isLoading: false,
              ),
              AppButton(
                  onPressed: () {},
                  text: 'play video',
                  paddingButton: 16,
                isLoading: false,
              ),
              // Stack(
              //   children: [
              //     SizedBox(
              //       height: 100.h,
              //       width: 100.w,
              //       child: video.value.isInitialized
              //           ? AspectRatio(
              //         aspectRatio: video.value.aspectRatio,
              //         child: VideoPlayer(video),
              //       )
              //           : Container(),
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: [
              //         FloatingActionButton(
              //           onPressed: () {
              //             video.pause();
              //             setState(() {
              //
              //             });
              //           },
              //           child: const Icon(Icons.pause),
              //         ),
              //         SizedBox(
              //           width: 16.w,
              //         ),
              //         FloatingActionButton(
              //           onPressed: () {
              //             videosPlay();
              //             setState(() {
              //
              //             });
              //           },
              //           child: const Icon(Icons.play_arrow),
              //         ),
              //       ],
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
