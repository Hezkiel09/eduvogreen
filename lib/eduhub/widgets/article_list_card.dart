import 'package:flutter/material.dart';
import '../models/article_model.dart';

class ArticleListCard extends StatelessWidget {
  final ArticleModel article;
  final VoidCallback onTap;

  const ArticleListCard({
    super.key,
    required this.article,
    required this.onTap,
  });

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

  @override
  Widget build(BuildContext context) {
    final color = _categoryColor(article.category);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: article.thumbnail.isEmpty
                  ? Container(
                      width: 100,
                      height: 110,
                      color: color.withValues(alpha: 0.15),
                      child: Icon(Icons.eco, color: color, size: 36),
                    )
                  : Image.asset(
                      article.thumbnail,
                      width: 100,
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 100,
                        height: 110,
                        color: color.withValues(alpha: 0.15),
                        child: Icon(Icons.eco, color: color, size: 36),
                      ),
                    ),
            ),

            // Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label kategori
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        article.category,
                        style: TextStyle(
                          color: color,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Judul
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Metadata
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 12,
                          color: Colors.black38,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            article.authorName,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black45,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 12,
                          color: Colors.black38,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${article.readTimeMinutes} menit baca  •  ${article.publishDate}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
