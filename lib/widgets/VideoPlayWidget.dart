import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayWidget extends StatefulWidget {
  const VideoPlayWidget({
    super.key,
    required this.videoID,
  });

  final String videoID;

  @override
  State<VideoPlayWidget> createState() => _VideoPlayWidgetState();
}

class _VideoPlayWidgetState extends State<VideoPlayWidget> {
  late YoutubePlayerController videoPlayerController;

  @override
  initState() {
    super.initState();

    videoPlayerController = YoutubePlayerController(
        initialVideoId: widget.videoID,
        flags: const YoutubePlayerFlags(
          hideControls: false,
          disableDragSeek: true,
          controlsVisibleAtStart: false,
          enableCaption: false,
          showLiveFullscreenButton: false,
          isLive: false,
          useHybridComposition: false,
          autoPlay: true,
          mute: false,
        ));
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.playerState == PlayerState.ended) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    videoPlayerController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    videoPlayerController.fitWidth(MediaQuery.of(context).size);
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                aspectRatio: 0.8,
                controller: videoPlayerController,
              ),
              builder: (context, player) {
                return player;
              }),
        ),
        Positioned(
            top: 30,
            right: 20,
            child: /*CustomOutlinedButton(text: "Done", onPressed: () {
              Navigator.pop(context);
            },
              buttonTextStyle: TextStyle(color: Colors.white),
            buttonStyle:  ButtonStyle(backgroundColor : MaterialStateProperty.all<Color>(
                Colors.blueGrey), elevation: MaterialStateProperty.all<double>(10)),

            )*/

                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 1.0,
                          color: Colors.white), // Customize the border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5.0), // Customize the border radius
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      '< Done',
                      style: TextStyle(color: Colors.white),
                    )))
      ],
    );
  }
}
