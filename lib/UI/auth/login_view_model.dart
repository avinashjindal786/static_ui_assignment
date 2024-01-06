import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/login_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.router.dart';
import '../../core/API/api_service.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';
import 'package:crypto/crypto.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NeededVariables _neededVariables = locator<NeededVariables>();
  NeededVariables get neededVariables => _neededVariables;

  final ApiService apiService = locator<ApiService>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginResponseModel? loginResponseModel;

  bool checkbox = false;

  String errorEmailText = "";
  String errorPasswordText = "";

  changeStatus() {
    checkbox = !checkbox;
    notifyListeners();
  }

  init() {
    
  }

  validationFunction() async {
    if (email.text == "" && password.text == "") {
      Fluttertoast.showToast(msg: "Please Enter Email and Passwosd...");
      errorEmailText = "Please Enter Email";
      errorPasswordText = "Please Enter Password";
    } else {
      errorEmailText = "";
      errorPasswordText = "";
      if (!email.text.contains("@")) {
        errorEmailText = "Enter Valid Email";
        Fluttertoast.showToast(msg: "Please Enter Valid Email ID...");
      } else if (password.text == "") {
        errorPasswordText = "Enter Password";
        Fluttertoast.showToast(msg: "Please Enter Password...");
      } else {
        errorEmailText = "";
        errorPasswordText = "";
        await login();
      }
    }
    notifyListeners();
  }

  Future login() async {
    try {
      setBusy(true);
      var passInBytes = utf8.encode("apple");
      var passInSHA256 = sha256.convert(passInBytes);
      log(passInSHA256.toString());
      loginResponseModel = await apiService.login(email.text, "8776f108e247ab1e2b323042c049c266407c81fbad41bde1e8dfc1bb66fd267e", "password");
      _neededVariables.sharedPreferences.setString("accessToken", loginResponseModel?.response?.accessToken ?? "");
      _navigationService.navigateToHomeScreen();
      setBusy(false);
    } catch (e) {
      Fluttertoast.showToast(msg: "Invalid Login Id or Password");
      setBusy(false);
      log(e.toString());
    }
  }
}
