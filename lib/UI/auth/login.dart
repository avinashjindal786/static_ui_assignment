import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/fonts_and_sizes.dart';
import '../../core/widgets/textfields/primary_textfield.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onViewModelReady: (model)=>model.init(),
      builder: (context, model, child) {
        return LoadingOverlay(
          isLoading: model.isBusy,
          progressIndicator: const CircularProgressIndicator(
            color: Colors.white,
          ),
          opacity: 0.5,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            extendBody: true,
            appBar: AppBar(
              centerTitle: true,
              title: const Text("promilo"),
              titleTextStyle: TextStyles.urbanistBold.blueColor.f20,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "By continuing, you agree to",
                      style: TextStyles.urbanistRegular.greyLight.f12.copyWith(height: 2.4),
                    ),
                    TextSpan(
                      text: "\nTerms of Use & Privacy Policy.",
                      style: TextStyles.urbanistRegular.black.f12,
                    )
                  ])),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                    ),
                    Text(
                      "Hi, Welcome Back!",
                      style: TextStyles.urbanistBold.f20.blueColor,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PrimaryTextField(
                          hintText: 'Enter Email or Mob No.',
                          labelText: "Please Sign in to Continue",
                          controller: model.email,
                          err: model.errorEmailText,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Sign In With OTP",
                          style: TextStyles.urbanistMedium.f12.copyWith(color: const Color(0xFF016599)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PrimaryTextField(
                          hintText: 'Enter password',
                          labelText: 'Password',
                          controller: model.password,
                          err: model.errorPasswordText,
                          obscureText: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: model.checkbox,
                                    onChanged: (onChange) {
                                      model.changeStatus();
                                    }),
                                Text(
                                  "Remember Me",
                                  style: TextStyles.urbanistMedium.f12.copyWith(color: const Color(0xFF9a9a9a)),
                                ),
                              ],
                            ),
                            Text(
                              "Forgot Password",
                              style: TextStyles.urbanistMedium.f12.copyWith(color: const Color(0xFF016599)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () async{
                           await model.validationFunction();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(color: Color(0xFFb4c6d3), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF0c8ce9))),
                            child: Center(
                              child: Text("Submit", style: TextStyles.urbanistMedium.f20.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.42,
                                child: Divider(
                                  color: FontColors.greyDark,
                                )),
                            Text("or", style: TextStyles.urbanistMedium.f14.black),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.42,
                              child: Divider(
                                color: FontColors.greyDark,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/7123025_logo_google_g_icon.png",
                              scale: 8,
                            ),
                            Image.asset(
                              "assets/images/icons8-facebook-144.png",
                              scale: 3,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Business User?",
                                      style: TextStyles.urbanistRegular.greyDark.f12.copyWith(height: 2.4),
                                    ),
                                    TextSpan(
                                      text: "\nLogin Here",
                                      style: TextStyles.urbanistMedium.f14.copyWith(color: const Color(0xFF016599)),
                                    )
                                  ])),
                              RichText(
                                  textAlign: TextAlign.right,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Don't have an account",
                                      style: TextStyles.urbanistRegular.greyDark.f12.copyWith(height: 2.4),
                                    ),
                                    TextSpan(
                                      text: "\nSign Up",
                                      style: TextStyles.urbanistMedium.f14.copyWith(color: const Color(0xFF016599)),
                                    )
                                  ])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
