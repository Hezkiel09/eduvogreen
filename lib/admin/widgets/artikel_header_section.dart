import 'package:flutter/material.dart';

class ArtikelHeaderSection extends StatelessWidget {
  final String? fileName;
  final Function(String) onUpload;
  final VoidCallback onDelete;

  const ArtikelHeaderSection({
    super.key,
    required this.fileName,
    required this.onUpload,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Header",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),

          const SizedBox(height: 16),

          GestureDetector(
            onTap: () => onUpload("PNG_356.png"),
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, size: 40),
                    SizedBox(height: 10),
                    Text("Unggah Thumbnail *"),
                    SizedBox(height: 6),
                    Text("Format JPG/JPEG, PNG maks 2MB"),
                  ],
                ),
              ),
            ),
          ),

          if (fileName != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: onDelete,
                  child: const Icon(Icons.close, color: Colors.red),
                ),
                const SizedBox(width: 6),
                Text(fileName!),
              ],
            )
          ]
        ],
      ),
    );
  }
}