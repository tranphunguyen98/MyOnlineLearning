import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String link;
  final String nameVideo;

  const VideoView(this.link, this.nameVideo);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController _controller;
  bool downloading = false;
  String progressString = "0%";

  Future<String> downloadFile(String url) async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      print("pathhhhhhhhhhhh ${dir.path}");
      final pathName = "${dir.path}/${widget.nameVideo}";
      await dio.download(url, pathName, onReceiveProgress: (rec, total) {
        // print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
      return pathName;
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

  @override
  void initState() {
    print("promo: ${widget.link}");
    super.initState();
    if (widget.link.contains("Algorithm")) {
      print("loveeeeeeeee");
      downloadFile(widget.link).then((value) {
        print("link file : $value");
        File file = File(value);
        _controller = VideoPlayerController.file(file)
          ..initialize().then((_) {
            print("promo:load ${widget.link}");

            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
      });
    } else {
      _controller = VideoPlayerController.network(widget.link)
        ..initialize().then((_) {
          print("promo:load ${widget.link}");

          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller?.value != null) {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        }
      },
      child: SizedBox(
        height: 240.0,
        width: double.infinity,
        child: Stack(
          children: [
            if (_controller?.value != null && _controller.value.initialized)
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
                    //  Icons.play_circle_outline,
                    _controller?.value == null
                        ? Icons.pause_circle_outline
                        : _controller.value.isPlaying
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
