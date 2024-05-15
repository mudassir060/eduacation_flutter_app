import 'package:camera/camera.dart';
import 'package:education/ui/views/camera/camera_view_model.dart';
import 'package:education/ui/views/camera/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CameraViewBody extends ViewModelWidget<CameraViewModel> {
  const CameraViewBody({super.key});

  @override
  Widget build(
    BuildContext context,
    CameraViewModel viewModel,
  ) {
    return viewModel.isBusy
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Stack(
              children: [
                Positioned.fill(
                  child: viewModel.videoFile == null
                      ? CameraPreview(viewModel.controller)
                      : const VideoPlayerCameraViewBody(),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  right: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Duration(seconds: viewModel.recordingDuration)
                            .toString()
                            .split('.')
                            .first,
                      ),
                      IconButton(
                          onPressed: viewModel.toggleCamera,
                          icon: const Icon(Icons.flip_camera_ios_outlined)),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
