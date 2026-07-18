import 'package:claimit_app/core/constants/screen_sizes.dart';
import 'package:claimit_app/features/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';

import 'package:glass_kit/glass_kit.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginController>();
    final controllerwatch = context.watch<LoginController>();
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Screens.width(context) * 0.05,
                vertical: Screens.padingHeight(context) * 0.02,
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Center(
                      child: Column(
                        children: [
                          GlassContainer.clearGlass(
                            padding: EdgeInsets.all(10),
                            width: Screens.width(context) * 0.17,
                            height: Screens.padingHeight(context) * 0.085,

                            borderRadius: BorderRadius.circular(40),
                            blur: 5,
                            color: Colors.white.withOpacity(0.1),
                            borderWidth: 0.5,
                            elevation: 10,
                            child: Image.asset('Assets/launcher_icon.png'),
                          ),
                          SizedBox(
                            height: Screens.padingHeight(context) * 0.02,
                          ),
                          Text(
                            'Welcome back 😎',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.5,
                            ),
                          ),
                          SizedBox(
                            height: Screens.padingHeight(context) * 0.01,
                          ),
                          Text(
                            'Log in to Continue',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: Screens.padingHeight(context) * 0.05),

                    _buildLabel('Email'),
                    SizedBox(height: Screens.padingHeight(context) * 0.02),
                    TextFormField(
                      controller: LoginController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: _inputDecoration(
                        hint: 'you@gmail.com',
                        prefixIcon: Icons.mail_outline,
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Enter your email';
                        }
                        if (!val.contains('@')) return 'Enter a valid email';
                        return null;
                      },
                    ),

                    SizedBox(height: Screens.padingHeight(context) * 0.035),

                    _buildLabel('Password'),
                    SizedBox(height: Screens.padingHeight(context) * 0.02),
                    TextFormField(
                      controller: LoginController.passwordController,
                      obscureText: controller.obscurePassword,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: _inputDecoration(
                        hint: '••••••••',
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: GestureDetector(
                          onTap:
                              () => setState(
                                () =>
                                    controller.obscurePassword =
                                        !controller.obscurePassword,
                              ),
                          child: Icon(
                            controllerwatch.obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Enter your password';
                        }
                        if (val.length < 6) return 'Minimum 6 characters';
                        return null;
                      },
                    ),

                    SizedBox(height: Screens.padingHeight(context) * 0.02),

                    InkWell(
                      onTap: () {
                        controllerwatch.isLoading
                            ? null
                            : controller.loginWithEmail(context);
                      },
                      child: GlassContainer.clearGlass(
                        height: Screens.padingHeight(context) * 0.065,
                        width: Screens.width(context),
                        borderRadius: BorderRadius.circular(10),
                        blur: 5,
                        color: Colors.white.withOpacity(0.1),
                        borderWidth: 0.5,
                        elevation: 10,
                        child: Center(
                          child:
                              controllerwatch.isLoading
                                  ? SizedBox(
                                    width: Screens.width(context) * 0.06,
                                    height:
                                        Screens.padingHeight(context) * 0.03,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: Colors.white,
                                    ),
                                  )
                                  : Text(
                                    'Log In',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey[500],
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[700], fontSize: 14),
      prefixIcon: Icon(prefixIcon, color: Colors.grey[600], size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[800]!, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[800]!, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF1A73E8), width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 0.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}
