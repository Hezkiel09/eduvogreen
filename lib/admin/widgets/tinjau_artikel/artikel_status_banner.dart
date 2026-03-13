import 'package:flutter/material.dart';

class ArtikelStatusBanner extends StatelessWidget {
  final String text;

  const ArtikelStatusBanner({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: const BoxDecoration(
        color: Color(0xff3D7C43),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}