import 'dart:async';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  HomePage()));
    });
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0659c6),
              Color(0xff4389f3),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/images/logo.json',
                height: width * 0.51,
              ),
              SizedBox(height: 6),
              Text('Weather Live',
                  style: TextStyle(
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'poppins')),
            ],
          ),
        ),
      ),
    );
  }
}