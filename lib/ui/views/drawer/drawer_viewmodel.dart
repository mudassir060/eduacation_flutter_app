import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:education/app/app.router.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/login_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../utils/shared_preferences.dart';

class DrawerViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();
  userData get UserData => _loginService.UserData;
  navigatebottomdashboard() {
    _navigationService.navigateToButtomBarView();
    notifyListeners();
  }

  navigateToCameraView() async {
    XFile? videoFile = await _navigationService.navigateToCameraView();
    TaskSnapshot taskSnapshot =
        await FirebaseStorage.instance.ref("fileName").putFile(
            File(videoFile!.path),
            SettableMetadata(
              contentType: 'video/mp4',
              cacheControl: 'public,max-age=31536000',
            ));

    if (taskSnapshot.state == TaskState.success) {
      var fileUrl = await taskSnapshot.ref.getDownloadURL();
      log(fileUrl);
      return fileUrl;
    } else {
      return null;
    }
  }

  navigatecontact() {
    _navigationService.navigateToContactView();
  }

  navigatePopularTeacher() {
    _navigationService.navigateToPopularView();
  }

  navigateELearning() {
    _navigationService.navigateToELearningView();
  }

  navigateSetting() {
    _navigationService.navigateToSettingView();
  }

  navigateEbook() {
    _navigationService.navigateToEBookView();
  }

  navigateListOfCourses() {
    _navigationService.navigateToMyCoursesView();
  }

  navigateAcount() {
    _navigationService.navigateToAcountView();
  }

  navigateFavourit() {
    _navigationService.navigateToFavouritesubView();
  }

  removeDataFromSpAndGoToLogin() async {
    _navigationService.back();
    await Store.removeValueAgainstKey('userId');
    _loginService.setOnlineStatus(false);
    _navigationService.navigateToLoginView();
  }

  // navigatePopularTeacher() {
  //   _navigationService.navigateToContactView();
  // }

  // navigatePopularTeacher() {
  //   _navigationService.navigateToContactView();
  // }
}
