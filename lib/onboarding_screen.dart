import 'package:flutter/material.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .stretch,
          children: [Image.asset('assets/obp1.png', width: 100, height: 150)],
        ),
      ),
    );
  }
}
