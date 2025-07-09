import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_clone/components/animated_loading_text.dart';
import 'package:flutter_portfolio_clone/components/animated_texts_componenets.dart';
import 'package:flutter_portfolio_clone/sections/portfolio_page.dart';
import 'package:flutter_portfolio_clone/theme/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PortfolioPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
