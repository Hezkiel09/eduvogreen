import 'package:flutter/material.dart';

class HomeStatsCard extends StatelessWidget {
  const HomeStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      // Clip isi supaya mengikuti radius card
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),

        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                // Hijau full tinggi (atas & bawah)
                color: const Color(0xFF148A43),

                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/riser_badge_silver.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Expanded(
                      child: Text(
                        'Riser\nForest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Expanded(
              flex: 3,
              child: _StatItem(
                number: '04',
                label: 'aksi telah\ndilakukan',
                icon: Icons.eco,
              ),
            ),

            const Expanded(
              flex: 3,
              child: _StatItem(
                number: '14',
                label: 'artikel telah\ndibaca',
                icon: Icons.menu_book,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatItem({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF148A43),
                ),
              ),
              const SizedBox(width: 4),
              Icon(icon, size: 16, color: const Color(0xFF148A43)),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
