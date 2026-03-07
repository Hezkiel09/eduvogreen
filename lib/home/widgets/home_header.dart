import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String avatarAsset;

  const HomeHeader({
    super.key,
    required this.userName,
    required this.avatarAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,

      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/BG.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
      ),

      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.20),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(26),
            bottomRight: Radius.circular(26),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(avatarAsset),
                ),
              ),
              const SizedBox(height: 12),

              Text(
                'Hi, $userName',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),

              const Text(
                'Temukan aksi favoritmu!',
                style: TextStyle(
                  color: Color(0xFACC15),
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Jelajahi relawan dan artikel yang tersedia melalui menu dibawah ya, Eduvors!!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
