import 'package:flutter/material.dart';

class ArtikelIsiSection extends StatefulWidget {
  final TextEditingController controller;

  const ArtikelIsiSection({super.key, required this.controller});

  @override
  State<ArtikelIsiSection> createState() => _ArtikelIsiSectionState();
}

class _ArtikelIsiSectionState extends State<ArtikelIsiSection> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {});
    });
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
              Icon(Icons.notes, color: Color(0xff2E7D32)),
              SizedBox(width: 10),
              Text(
                "Isi Artikel *",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextField(
              controller: widget.controller,
              maxLines: null,
              expands: true,
              maxLength: 300,
              decoration: const InputDecoration(
                hintText: "Tuliskan riset, opini, atau pengalamanmu di sini...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(14),
                counterText: "",
              ),
            ),
          ),

          const SizedBox(height: 8),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${widget.controller.text.length}/300",
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
