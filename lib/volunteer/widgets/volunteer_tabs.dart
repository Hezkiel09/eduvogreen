import 'package:flutter/material.dart';

class VolunteerTabs extends StatelessWidget {

  final int selectedTab;
  final Function(int) onTap;

  const VolunteerTabs({
    super.key,
    required this.selectedTab,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),

      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),

      child: Row(
        children: [

          _buildTab("Pendaftaran Dibuka", 0),
          _buildTab("Akan Datang", 1),

        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {

    bool active = selectedTab == index;

    return Expanded(
      child: GestureDetector(

        onTap: () => onTap(index),

        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),

          decoration: BoxDecoration(
            color: active ? const Color(0xff2E7D32) : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),

          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: active ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}