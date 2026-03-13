import 'package:flutter/material.dart';

class ArtikelTabBar extends StatelessWidget {
  final int selected;
  final Function(int) onTap;

  const ArtikelTabBar({
    super.key,
    required this.selected,
    required this.onTap,
  });

  final tabs = const [
    'Belum Ditinjau',
    'Proses Peninjauan',
    'Telah Disetujui',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final active = selected == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                decoration: BoxDecoration(
                  color: active ? const Color(0xff3D7C43) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    color: active ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}