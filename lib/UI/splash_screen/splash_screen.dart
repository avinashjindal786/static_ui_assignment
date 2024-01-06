import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/fonts_and_sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final NavigationService _navigationService = locator<NavigationService>();
  final NeededVariables _neededVariables = locator<NeededVariables>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      final val = _neededVariables.sharedPreferences.getString("accessToken");
      if (val != null) {
        _navigationService.navigateToHomeScreen();
      } else {
        _navigationService.navigateToLoginScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    FontSizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
            child: Text(
          "promilo",
          style: TextStyles.urbanistBold.blueColor.f34,
        )),
      ),
    );
  }
}
