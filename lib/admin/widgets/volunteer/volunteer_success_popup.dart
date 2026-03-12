import 'package:flutter/material.dart';

class VolunteerSuccessPopup extends StatelessWidget {
  final VoidCallback onContinue;

  const VolunteerSuccessPopup({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// ICON BESAR
            const CircleAvatar(
              radius: 56,
              backgroundColor: Color(0xff2E7D32),
              child: Icon(Icons.check, color: Colors.white, size: 64),
            ),

            const SizedBox(height: 28),

            /// TITLE
            const Text(
              "Volunteer Berhasil\nDitambahkan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 24),

            /// FUN FACT
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "funfact: ",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text:
                        "Walaupun hanya menutupi sekitar 1% dasar laut, terumbu karang menjadi rumah bagi lebih dari 25% spesies laut.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E7D32),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Lanjutkan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
