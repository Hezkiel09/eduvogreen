import 'package:flutter/material.dart';

class ArtikelActionButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback onTap;

  const ArtikelActionButton({
    super.key,
    required this.text,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: enabled ? const Color(0xff3D7C43) : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(28),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}