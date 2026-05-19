import 'dart:developer';

import 'package:Claimit_app/Constant/constantvalue.dart';
import 'package:Claimit_app/Constant/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Claimit_app/Constant/constantroute.dart';
import 'package:Claimit_app/Model/giveawaymodel.dart';
import 'package:Claimit_app/Service/giveawayapi.dart';

class SplashCtrl extends ChangeNotifier {
  bool loading = false;
  List<GiveawayModel> itemlist = [];
  init(context) async {
    await productApiCall();
    await checkLogin(context);
  }

  checkLogin(context) async {
    var isLogged = await HelperFunction.getIsLoggedIn();

    if (isLogged == false || isLogged == null) {
      Get.offAllNamed(ConstantRoute.loginpage);
    } else {
      var email = await HelperFunction.getMailSP();
      var password = await HelperFunction.getPasswordSP();
      ConstantValues.usermail = email;
      notifyListeners();

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!,
          password: password!,
        );

        Get.offAllNamed(ConstantRoute.dashboard);
      } on FirebaseAuthException catch (e) {
        String message = 'Login failed';

        if (e.code == 'user-not-found') {
          message = 'No account found with this email';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password';
        } else if (e.code == 'invalid-email') {
          message = 'Invalid email address';
        } else if (e.code == 'too-many-requests') {
          message = 'Too many attempts. Try again later';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
        Get.offAllNamed(ConstantRoute.loginpage);
      }
    }
  }

  productApiCall() async {
    await GiveawayAPI.getData().then((value) {
      if (value.rescode! >= 200 && value.rescode! <= 210) {
        log('200 Success productApiCall');
        itemlist = value.data!;
        notifyListeners();
      } else if (value.rescode! >= 400 && value.rescode! <= 410) {
        log('400 error productApiCall');
        Get.snackbar(
          '400 Error',
          'SomeThing Went Wrong',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3),
        );
        notifyListeners();
      } else {
        log('500 error productApiCall');
        Get.snackbar(
          '500 Error',
          'Network Error - Unreachable',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3),
        );
        notifyListeners();
      }
    });
  }
}
