import 'package:flutter/material.dart';

class VolunteerThumbnailSection extends StatelessWidget {
  final String? fileName;
  final Function(String) onUpload;
  final VoidCallback onDelete;

  const VolunteerThumbnailSection({
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
          const Row(
            children: [
              Icon(Icons.image_outlined, color: Color(0xff2E7D32)),
              SizedBox(width: 10),
              Text(
                "Thumbnail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ],
          ),

          const SizedBox(height: 16),

          GestureDetector(
            onTap: () => onUpload("PNG_356.png"),
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, size: 42, color: Color(0xff2E7D32)),
                    SizedBox(height: 10),
                    Text(
                      "Unggah Thumbnail *",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Format JPG/JPEG, PNG maks 2MB",
                      style: TextStyle(color: Colors.grey),
                    ),
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
            ),
          ],
        ],
      ),
    );
  }
}
