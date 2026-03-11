import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final category = args?['category'] ?? 'Reboisasi';
    final title =
        args?['title'] ??
        'Mengembalikan Napas Pesisir: Peran Mangrove Menahan Abrasi';
    final author = args?['author'] ?? 'Antonio Ngarusolo';
    final date = args?['date'] ?? '3 Maret 2026';
    final imageAsset = args?['image'] ?? '';
    final articleContent = args?['content'] ?? 'Konten artikel belum tersedia.';

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(28),
                    ),
                    child: Image.asset(
                      imageAsset,
                      height: 260,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          height: 260,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                          child: const Icon(
                            Icons.image,
                            size: 42,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),

              Transform.translate(
                offset: const Offset(0, -20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF148A43),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                          color: Color(0xFF2B2B2B),
                        ),
                      ),
                      const SizedBox(height: 14),

                      Row(
                        children: [
                          const Icon(
                            Icons.account_circle_outlined,
                            size: 18,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              author,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 14),

                      TextButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Artikel disimpan')),
                          );
                        },
                        icon: const Icon(Icons.bookmark_border, size: 18),
                        label: const Text('Save'),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF148A43),
                        ),
                      ),

                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 12),

                      Text(
                        articleContent,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.7,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
