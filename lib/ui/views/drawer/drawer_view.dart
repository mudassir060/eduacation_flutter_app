import 'package:education/ui/widgets/networkImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'drawer_viewmodel.dart';

class DrawerView extends StackedView<DrawerViewModel> {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DrawerViewModel viewModel,
    Widget? child,
  ) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Drawer(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      width: width * 0.55,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.25,
            child: Center(
              child: DrawerHeader(
                decoration: BoxDecoration(
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        networkImage(viewModel.UserData.profile, 40, 40, true),
                        const SizedBox(width: 8),
                        Column(
                          //  mainAxisAlignment:
                          //      MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.UserData.username ?? "",
                              style: GoogleFonts.ibmPlexSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              viewModel.UserData.userType ?? "",
                              style: GoogleFonts.ibmPlexSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home_outlined,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('Home'),
                    minLeadingWidth: 0.009,
                    onTap: viewModel.navigatebottomdashboard,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.camera,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('Camera'),
                    minLeadingWidth: 0.009,
                    onTap: viewModel.navigateToCameraView,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.account_box,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('Account'),
                    minLeadingWidth: 0.009,
                    onTap: viewModel.navigateAcount,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.contacts_outlined,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('Contacts'),
                    minLeadingWidth: 0.009,
                    onTap: viewModel.navigatecontact,
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.groups_2_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('Teachers'),
                      minLeadingWidth: 0.009,
                      onTap: viewModel.navigatePopularTeacher),
                  ListTile(
                    leading: Icon(
                      Icons.book_outlined,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('Courses'),
                    minLeadingWidth: 0.009,
                    onTap: viewModel.navigateListOfCourses,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.book_outlined,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('Favourit'),
                    minLeadingWidth: 0.009,
                    onTap: viewModel.navigateFavourit,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.menu_book,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('E-Book'),
                    minLeadingWidth: 0.009,
                    onTap: viewModel.navigateEbook,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.keyboard_command_key_rounded,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('E-Learning'),
                    minLeadingWidth: 0.009,
                    onTap: viewModel.navigateELearning,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings_outlined,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('Settings'),
                    minLeadingWidth: 0.009,
                    onTap: viewModel.navigateSetting,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    title: const Text('Logout'),
                    minLeadingWidth: 0.009,
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      viewModel.removeDataFromSpAndGoToLogin();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  DrawerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DrawerViewModel();
}
