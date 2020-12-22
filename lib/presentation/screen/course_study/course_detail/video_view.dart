import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final Course course;

  const VideoView(this.course);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController _controller;

  @override
  void initState() {
    print("promo: ${widget.course.promoVidUrl}");

    super.initState();
    _controller = VideoPlayerController.network(widget.course.promoVidUrl)
      ..initialize().then((_) {
        print("promo:load ${widget.course.promoVidUrl}");

        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: SizedBox(
        height: 240.0,
        width: double.infinity,
        child: Stack(
          children: [
            if (_controller.value.initialized)
              // AspectRatio(
              //   aspectRatio: _controller.value.aspectRatio,
              //   child: VideoPlayer(_controller),
              // )
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller), //here it is!!
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              )
            else
              Container(),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                    size: 64.0,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
