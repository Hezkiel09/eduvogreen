import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/widgets/home_bottom_nav.dart';
import 'widgets/article_list_card.dart';
import 'cubit/article_cubit.dart';

class EduHubScreen extends StatefulWidget {
  const EduHubScreen({super.key});

  @override
  State<EduHubScreen> createState() => _EduHubScreenState();
}

class _EduHubScreenState extends State<EduHubScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    // Fetch articles on load
    context.read<ArticleCubit>().fetchArticles();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<ArticleCubit>().searchArticles(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF148A43),
        onPressed: () {
          Navigator.pushNamed(context, '/add-article');
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      bottomNavigationBar: const HomeBottomNav(currentIndex: 2),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/BG.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.22),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Edukasi',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Pelajari dan pahami wawasan\ntentang lingkungan!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // search bar
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: _onSearchChanged,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 12, color: Colors.black87),
                        decoration: const InputDecoration(
                          hintText: 'Cari artikel atau topik...',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black38,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black45,
                            size: 18,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: BlocBuilder<ArticleCubit, ArticleState>(
                builder: (context, state) {
                  if (state is ArticleLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF148A43),
                      ),
                    );
                  } else if (state is ArticleError) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else if (state is ArticleLoaded) {
                    final articles = state.articles;

                    if (articles.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off, size: 60, color: Colors.grey.shade400),
                            const SizedBox(height: 16),
                            const Text(
                              'Artikel tidak ditemukan',
                              style: TextStyle(color: Colors.black54, fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                      itemCount: articles.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 14),
                      itemBuilder: (context, index) {
                        final item = articles[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/article-detail',
                              arguments: item,
                            );
                          },
                          child: ArticleListCard(
                            category: item.category,
                            title: item.title,
                            preview: item.content.length > 100
                                ? '${item.content.substring(0, 100)}...'
                                : item.content,
                            author: item.authorName,
                            date: item.publishDate,
                            imageAsset: item.thumbnail,
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
