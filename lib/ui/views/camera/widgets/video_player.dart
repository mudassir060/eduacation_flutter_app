import 'package:education/ui/views/camera/camera_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCameraViewBody extends ViewModelWidget<CameraViewModel> {
  const VideoPlayerCameraViewBody({super.key});

  @override
  Widget build(
    BuildContext context,
    CameraViewModel viewModel,
  ) {
    return
// Use a FutureBuilder to display a loading spinner while waiting for the
// VideoPlayerController to finish initializing.
        FutureBuilder(
      future: viewModel.initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return AspectRatio(
            aspectRatio: viewModel.videoPlayerController.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: Stack(
              children: [
                VideoPlayer(viewModel.videoPlayerController),
                Center(
                  child: IconButton(
                    onPressed: viewModel.videoPlayer,
                    icon: Icon(
                      viewModel.videoPlayerController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 45,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
