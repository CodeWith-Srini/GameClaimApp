import 'package:Claimit_app/Constant/constantroute.dart';
import 'package:Claimit_app/Constant/constantvalue.dart';
import 'package:Claimit_app/Constant/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends ChangeNotifier {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool obscurePassword = true;

  // ── Email / Password Login ──────────────────────────────
  loginWithEmail(context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await HelperFunction.setMailSP(emailController.text);
      await HelperFunction.setPasswordSP(passwordController.text);
      await HelperFunction.setIsLoggedIn(true);
      ConstantValues.usermail = emailController.text;
      notifyListeners();

      // Navigate to home screen after login

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

      showSnackbar(context, message, isError: true);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ── Google Sign In ──────────────────────────────────────
  // Future<void> _loginWithGoogle() async {
  //   setState(() => _isLoading = true);

  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) {
  //       setState(() => _isLoading = false);
  //       return; // User cancelled
  //     }

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     await FirebaseAuth.instance.signInWithCredential(credential);

  //     if (mounted) {
  //       Navigator.pushReplacementNamed(context, '/home');
  //     }
  //   } catch (e) {
  //     _showSnackbar('Google sign-in failed. Try again.', isError: true);
  //   } finally {
  //     if (mounted) setState(() => _isLoading = false);
  //   }
  // }

  // ── Forgot Password ─────────────────────────────────────
  Future<void> forgotPassword(context) async {
    if (emailController.text.trim().isEmpty) {
      showSnackbar(context, 'Enter your email first');
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      showSnackbar(context, 'Password reset email sent!');
    } on FirebaseAuthException catch (e) {
      showSnackbar(
        context,
        e.message ?? 'Error sending reset email',
        isError: true,
      );
    }
  }

  void showSnackbar(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
