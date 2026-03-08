import 'package:flutter/material.dart';

class ProgressParticipants extends StatelessWidget {
  final int current;
  final int max;

  const ProgressParticipants({
    super.key,
    required this.current,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    double progress = current / max;

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 18,
            backgroundColor: Colors.grey.shade300,
            color: const Color(0xff2E7D32),
          ),
        ),
        Text(
          "$current / $max Peserta",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}