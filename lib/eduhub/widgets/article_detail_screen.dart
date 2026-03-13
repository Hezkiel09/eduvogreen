import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';
import 'package:eduvogreen/cubit/auth_cubit.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({super.key});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  final ArticleService _articleService = ArticleService();
  bool _isSaved = false;
  bool _isLoadingSavedStatus = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkSavedStatus();
  }

  Future<void> _checkSavedStatus() async {
    final article = ModalRoute.of(context)?.settings.arguments as ArticleModel?;
    if (article == null) return;

    final authState = context.read<AuthCubit>().state;
    if (authState is Success) {
      // Kita butuh user ID dari supabase auth
      final user = context.read<AuthCubit>().currentUser;
      if (user != null) {
        final isSaved = await _articleService.isArticleSaved(user.id, article.id);
        if (mounted) {
          setState(() {
            _isSaved = isSaved;
            _isLoadingSavedStatus = false;
          });
        }
      }
    } else {
      setState(() => _isLoadingSavedStatus = false);
    }
  }

  Future<void> _toggleSave(ArticleModel article) async {
    final authState = context.read<AuthCubit>().state;
    if (authState is! Success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan login untuk menyimpan artikel')),
      );
      return;
    }

    final user = context.read<AuthCubit>().currentUser;
    if (user == null) return;

    // Simpan status lama untuk rollback jika gagal
    final oldStatus = _isSaved;
    setState(() => _isSaved = !_isSaved);

    try {
      await _articleService.toggleSaveArticle(user.id, article.id, oldStatus);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isSaved ? 'Artikel disimpan' : 'Artikel dihapus dari simpanan'),
            duration: const Duration(seconds: 1),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSaved = oldStatus);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final article =
        ModalRoute.of(context)?.settings.arguments as ArticleModel?;
    if (article == null) return const Scaffold(body: Center(child: Text('Artikel tidak ditemukan')));

    final category = article.category;
    final title = article.title;
    final author = article.authorName;
    final date = article.publishDate;
    final imageAsset = article.thumbnail;
    final articleContent = article.content;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      floatingActionButton: _isLoadingSavedStatus
          ? null
          : FloatingActionButton(
              backgroundColor: const Color(0xFF148A43),
              onPressed: () => _toggleSave(article),
              child: Icon(
                _isSaved ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.white,
              ),
            ),
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
                    child: imageAsset.startsWith('http')
                        ? Image.network(
                            imageAsset,
                            height: 260,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (_, child, progress) {
                              if (progress == null) return child;
                              return Container(
                                height: 260,
                                color: Colors.grey.shade200,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xFF148A43),
                                    strokeWidth: 2,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (_, __, ___) => Container(
                              height: 260,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.image, size: 42, color: Colors.grey),
                            ),
                          )
                        : Container(
                            height: 260,
                            width: double.infinity,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image, size: 42, color: Colors.grey),
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
