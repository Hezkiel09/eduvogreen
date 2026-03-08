import 'package:flutter/material.dart';
import 'models/article_model.dart';

class ArticleDetailScreen extends StatefulWidget {
  final ArticleModel article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    _isBookmarked = widget.article.isBookmarked;
  }

  Color _categoryColor(String category) {
    switch (category) {
      case 'Climate Action':
        return const Color(0xFF2196F3);
      case 'Sampah':
        return const Color(0xFFFF7043);
      case 'Energi Terbarukan':
        return const Color(0xFFFFA000);
      case 'Reboisasi':
        return const Color(0xFF148A43);
      default:
        return const Color(0xFF4FA057);
    }
  }

  void _showReportDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        final reasons = [
          'Informasi tidak akurat',
          'Konten menyesatkan',
          'Spam atau iklan',
          'Konten tidak relevan',
          'Lainnya',
        ];
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Laporkan Artikel',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              const Text(
                'Pilih alasan pelaporan:',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              ...reasons.map(
                (r) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(r, style: const TextStyle(fontSize: 14)),
                  leading: const Icon(
                    Icons.radio_button_unchecked,
                    color: Color(0xFF148A43),
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Laporan telah dikirim. Terima kasih!'),
                        backgroundColor: Color(0xFF148A43),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final article = widget.article;
    final catColor = _categoryColor(article.category);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // ── APP BAR / THUMBNAIL ──────────────────────────────
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: const Color(0xFF148A43),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              // Bookmark
              IconButton(
                icon: Icon(
                  _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() => _isBookmarked = !_isBookmarked);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _isBookmarked
                            ? 'Artikel disimpan!'
                            : 'Artikel dihapus dari simpanan',
                      ),
                      duration: const Duration(seconds: 1),
                      backgroundColor: const Color(0xFF148A43),
                    ),
                  );
                },
              ),

              // Report
              IconButton(
                icon: const Icon(Icons.flag_outlined, color: Colors.white),
                onPressed: _showReportDialog,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: article.thumbnail.isEmpty
                  ? Container(
                      color: catColor.withValues(alpha: 0.2),
                      child: Icon(Icons.eco, size: 80, color: catColor),
                    )
                  : Image.asset(
                      article.thumbnail,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: catColor.withValues(alpha: 0.2),
                        child: Icon(Icons.eco, size: 80, color: catColor),
                      ),
                    ),
            ),
          ),

          // ── KONTEN ARTIKEL ───────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label kategori
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: catColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      article.category,
                      style: TextStyle(
                        color: catColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Judul
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A1A),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Metadata
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xFF148A43),
                        child: Icon(
                          Icons.person,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.authorName,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            Text(
                              article.authorType,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            article.publishDate,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black45,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 12,
                                color: Colors.black38,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '${article.readTimeMinutes} menit baca',
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Divider(color: Color(0xFFEEEEEE)),
                  const SizedBox(height: 16),

                  // Isi artikel
                  Text(
                    article.content,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF333333),
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 24),
                  const Divider(color: Color(0xFFEEEEEE)),
                  const SizedBox(height: 14),

                  // Referensi
                  const Text(
                    'Referensi',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...article.references.asMap().entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '[${entry.key + 1}] ',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF148A43),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              entry.value,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                height: 1.5,
                              ),
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
        ],
      ),
    );
  }
}
