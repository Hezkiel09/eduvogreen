import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VolunteerThumbnailSection extends StatefulWidget {
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
  State<VolunteerThumbnailSection> createState() =>
      _VolunteerThumbnailSectionState();
}

class _VolunteerThumbnailSectionState extends State<VolunteerThumbnailSection> {
  Future<void> pickImage() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked == null) return;

    widget.onUpload(picked.path);
  }

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
            onTap: pickImage,
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(14),
              ),
              child: widget.fileName == null
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file,
                            size: 42,
                            color: Color(0xff2E7D32),
                          ),
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
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: kIsWeb
                          ? Image.network(
                              widget.fileName!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          : Image.file(
                              File(widget.fileName!),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                    ),
            ),
          ),

          if (widget.fileName != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: widget.onDelete,
                  child: const Icon(Icons.close, color: Colors.red),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    widget.fileName!.split('/').last,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
