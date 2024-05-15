import 'package:education/ui/views/camera/camera_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CameraViewBottomBar extends ViewModelWidget<CameraViewModel>
    implements PreferredSizeWidget {
  const CameraViewBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CameraViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: viewModel.onTapCancel,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Cancel", style: TextStyle(color: Colors.blueAccent)),
              ],
            ),
          ),
          viewModel.videoFile != null
              ? CircleAvatar(
                  child: IconButton(
                      onPressed: viewModel.reStore,
                      icon: const Icon(Icons.refresh)),
                )
              : CircleAvatar(
                  backgroundColor: viewModel.isRecording
                      ? Colors.blueAccent
                      : Colors.blueGrey,
                  child: IconButton(
                      onPressed: viewModel.recording,
                      icon: const Icon(Icons.camera)),
                ),
          InkWell(
            onTap: viewModel.onTapDone,
            child: SizedBox(
              height: 44 + MediaQuery.paddingOf(context).top,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Done", style: TextStyle(color: Colors.blueAccent)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
