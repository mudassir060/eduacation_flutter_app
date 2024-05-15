import 'package:education/ui/views/auth/signup/userTypeButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/app_utils.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomText(
                text: "Sign In",
                textAlign: TextAlign.center,
                fontSize: 18,
                color: const Color(0xff4873a6).withOpacity(0.7),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        //    backgroundColor: const Color(0xffe5f1f8),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const BigText(
                  text: "Join Brainly Community",
                  color: Colors.black,
                ),
                const SizedBox(height: 6),
                const BigSubText(
                  text: "Subscribe quickly with us",
                ),

                const SizedBox(height: 20),
                // ignore: prefer_const_constructors
                Stack(
                  children: [
                    Center(
                      child: viewModel.profile == null
                          ? const CircleAvatar(
                              radius: 65,
                              backgroundImage:
                                  AssetImage('assets/images/download.jpeg'),
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                            )
                          : CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(viewModel.profile),
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                            ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: viewModel.uploadProfile,
                            child: Container(
                              height: 40,
                              width: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(Icons.edit_outlined,
                                  color: Color(0xffffffff), size: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Name',
                      controller: viewModel.nameCTRL,
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      hintText: 'E-Mail',
                      controller: viewModel.emailCTRL,
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: viewModel.passwordCTRL,
                      isObscureText: viewModel.visibleCheck,
                      suffix: GestureDetector(
                        onTap: viewModel.visible_check,
                        child: Icon(
                          viewModel.visibleCheck == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ganderButton(viewModel),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                    GestureDetector(
                      onTap: () {
                        // viewModel.navigateVerify();
                        viewModel.sendOtp();
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff4873a6).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: ButtonText(
                          text: 'Sign up',
                          color: Colors.white,
                        )),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(children: [
                      const Expanded(
                          child: Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                      )),
                      Text(
                        "OR",
                        style: GoogleFonts.ibmPlexSans(fontSize: 12),
                      ),
                      const Expanded(
                          child: Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                      )),
                    ]),
                    const SizedBox(height: 20),
                    const BigSubText(
                      text: "We Never share anything on your behalf",
                    ),
                    const SizedBox(height: 27),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  width: 1),
                              color: const Color(0xff868686),
                              shape: BoxShape.circle),
                          child: Center(
                              child: Image.asset(
                            'assets/icons/apple-logo.png',
                            width: 22,
                          )),
                        ),
                        Container(
                          // padding: const EdgeInsets.all(20),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  width: 1),
                              shape: BoxShape.circle),
                          child: Center(
                              child: Image.asset(
                            'assets/icons/google-48.png',
                            width: 22,
                          )),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  width: 1),
                              color: const Color(0xff5085fc),
                              shape: BoxShape.circle),
                          child: Center(
                              child: Image.asset(
                            'assets/icons/icons8-fb-24.png',
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
