import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : Container(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );

  Widget buildVideo() => Stack(
    children: <Widget>[
      buildVideoPlayer(),
      Positioned.fill(child: BasicOverlayWidget(controller: controller)),
    ],
  );

  Widget buildVideoPlayer() => AspectRatio(
    aspectRatio: controller.value.aspectRatio,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
        child: VideoPlayer(
            controller)
    ),
  );
}



class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () =>
    controller.value.isPlaying ? controller.pause() : controller.play(),
    child: Stack(
      children: <Widget>[
        buildPlay(),
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   right: 0,
        //   child: buildIndicator(),
        // ),
      ],
    ),
  );

  Widget buildIndicator() => VideoProgressIndicator(
    controller,
    allowScrubbing: true,
  );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Center(
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:  Colors.white.withOpacity(0.7)
          ),

          child: Icon(Icons.play_arrow, color: Colors.black, size:50),
  ),
      );
}