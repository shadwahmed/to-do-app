import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splashScreen';
  @override
  Widget build(BuildContext context)
  {
    Timer(Duration(seconds: 4),
            () => Navigator.pushNamed(context, 'homeScreen'));
    return Container(
      color: Color(0xffDFECDB),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 300,
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Text(
            "supervised by Mohamed Nabil",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff3598DB),
            ),
          ),
        ],
      ),
    );
  }
}
