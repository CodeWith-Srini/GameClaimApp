import 'package:Claimit_app/Constant/constantroute.dart';
import 'package:Claimit_app/Constant/constantvalue.dart';
import 'package:Claimit_app/Constant/helper.dart';
import 'package:Claimit_app/Controller/dashboardcrtl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:Claimit_app/Constant/screens.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Screens.width(context) * 0.04,
          ),
          child: Column(
            children: [
              // SizedBox(height: Screens.padingHeight(context) * 0.03),
              // Row(
              //   children: [
              //     ClipRRect(
              //       borderRadius: BorderRadius.circular(10),
              //       child: GlassContainer.clearGlass(
              //         height: Screens.padingHeight(context) * 0.07,
              //         width: Screens.width(context) * 0.15,
              //         borderRadius: BorderRadius.circular(10),
              //         blur: 5,
              //         color: Colors.white.withOpacity(0.1),
              //         borderWidth: 0.5,
              //         elevation: 10,
              //         child: Container(
              //           padding: EdgeInsets.only(
              //             bottom: Screens.padingHeight(context) * 0.01,
              //           ),
              //           decoration: BoxDecoration(
              //             color: Colors.white.withOpacity(0.2),
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Lottie.asset('Assets/user.json'),
              //         ),
              //       ),
              //     ),

              //     SizedBox(width: Screens.width(context) * 0.02),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Srinivas',
              //           style: theme.textTheme.bodyMedium!.copyWith(
              //             color: Colors.white,
              //             fontFamily: GoogleFonts.exo2().fontFamily,
              //             letterSpacing: 1,
              //           ),
              //         ),
              //         Text(
              //           'Indie Flutter Developer',
              //           style: theme.textTheme.bodyMedium!.copyWith(
              //             color: Colors.white,
              //             fontFamily: GoogleFonts.exo2().fontFamily,
              //             letterSpacing: 1,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              SizedBox(height: Screens.padingHeight(context) * 0.03),
              Row(
                children: [
                  Image.asset('Assets/profile.png', scale: 1.5),
                  SizedBox(width: Screens.width(context) * 0.02),
                  SizedBox(
                    width: Screens.width(context) * 0.7,
                    child: Text(
                      ConstantValues.usermail!,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontFamily: GoogleFonts.exo2().fontFamily,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Screens.padingHeight(context) * 0.03),
              InkWell(
                onTap: () {
                  context.read<Dashboardcrtl>().openLink(
                    "https://github.com/srinibuson/GameClaimApp/releases",
                  );
                },
                child: Row(
                  children: [
                    Image.asset('Assets/git.png', scale: 1.5),
                    SizedBox(width: Screens.width(context) * 0.02),
                    SizedBox(
                      width: Screens.width(context) * 0.7,
                      child: Text(
                        'View In GitHub',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontFamily: GoogleFonts.exo2().fontFamily,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Screens.padingHeight(context) * 0.03),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'Assets/cup2.png',
                      color: Colors.white,
                      scale: 1.5,
                    ),
                  ),
                  SizedBox(width: Screens.width(context) * 0.02),
                  SizedBox(
                    width: Screens.width(context) * 0.7,

                    child: Text(
                      'Buy Me A Coffee',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontFamily: GoogleFonts.exo2().fontFamily,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Screens.padingHeight(context) * 0.03),
              InkWell(
                onTap: () {
                  context.read<Dashboardcrtl>().alertdialog(context);
                },
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'Assets/logout.png',
                        color: Colors.white,
                        scale: 1.5,
                      ),
                    ),
                    SizedBox(width: Screens.width(context) * 0.02),
                    SizedBox(
                      width: Screens.width(context) * 0.7,

                      child: Text(
                        'Log Out',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.redAccent,
                          fontFamily: GoogleFonts.exo2().fontFamily,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
