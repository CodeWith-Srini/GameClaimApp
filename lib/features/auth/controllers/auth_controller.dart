import 'dart:developer';

import 'package:claimit_app/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository repository;

  AuthController(this.repository);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mailregistercontroller = TextEditingController();
  final passwordregistercontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool obscurePassword = true;
  bool isLoadingReg = false;
  bool obscurePasswordReg = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    mailregistercontroller.dispose();
    passwordregistercontroller.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    try {
      await repository.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } on AuthException catch (e) {
      log(e.message);
      // rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
