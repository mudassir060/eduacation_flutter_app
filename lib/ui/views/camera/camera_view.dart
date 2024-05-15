import 'package:education/ui/views/camera/camera_view_model.dart';
import 'package:education/ui/views/camera/widgets/body.dart';
import 'package:education/ui/views/camera/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CameraView extends StackedView<CameraViewModel> {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CameraViewModel viewModel, Widget? child) {
    return const SafeArea(
      child: Scaffold(
        // backgroundColor: context.theme.backgrounds.primary,
        body: CameraViewBody(),
        bottomNavigationBar: CameraViewBottomBar(),
      ),
    );
  }

  @override
  void onViewModelReady(CameraViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  CameraViewModel viewModelBuilder(BuildContext context) => CameraViewModel();
}
