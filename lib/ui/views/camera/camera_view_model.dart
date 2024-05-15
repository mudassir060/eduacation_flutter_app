import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:education/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';

class CameraViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();


  void onViewModelReady() {
    initializeCamera();
  }

  Timer? timer;
  late CameraController controller;
  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;
  bool isRecording = false;
  int selectedCameraIndex = 0;
  int recordingDuration = 0;
  XFile? videoFile;

  Future<void> initializeCamera() async {
    setBusy(true);
    final cameras = await availableCameras();
    controller =
        CameraController(cameras[selectedCameraIndex], ResolutionPreset.medium);
    await controller.initialize();
    setBusy(false);
  }

  recording() {
    if (!isRecording) {
      controller.startVideoRecording();
      isRecording = true;
      notifyListeners();
      startTimer();
    } else {
      timer?.cancel();
      stopVideoRecording();
    }
  }

  reStore() {
    videoFile = null;
    recordingDuration = 0;
    notifyListeners();
  }

  videoPlayer() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    notifyListeners();
  }

  void toggleCamera() async {
    await controller.dispose();
    selectedCameraIndex = 1 - selectedCameraIndex;
    initializeCamera();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      recordingDuration++;
      notifyListeners();
      if (recordingDuration >= 30) {
        stopVideoRecording();
      }
    });
  }

  Future<void> stopVideoRecording() async {
    isRecording = false;
    timer?.cancel();
    recordingDuration = 0;
    notifyListeners();
    try {
      if (controller.value.isRecordingVideo) {
        videoFile = await controller.stopVideoRecording();
        videoPlayerController =
            VideoPlayerController.file(File(videoFile!.path));
        initializeVideoPlayerFuture = videoPlayerController.initialize();
        notifyListeners();
      }
    } on CameraException catch (e) {
      log(e.code);
    }
  }

  void onTapDone() {
    if (videoFile != null) {
      controller.dispose();
      _navigator.back(result: videoFile);
    }
  }

  void onTapCancel() {
    timer?.cancel();
    controller.dispose();
    _navigator.back();
  }
}
