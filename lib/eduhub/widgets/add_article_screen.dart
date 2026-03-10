import 'package:flutter/material.dart';

class AddArticleScreen extends StatefulWidget {
  const AddArticleScreen({super.key});

  @override
  State<AddArticleScreen> createState() => _AddArticleScreenState();
}

class _AddArticleScreenState extends State<AddArticleScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _tagController = TextEditingController();
  final _referenceController = TextEditingController();

  String _selectedCategory = 'Climate Action';
  final List<String> _tags = [];
  final List<String> _references = [];
  bool _hasThumbnail = false;
  int _wordCount = 0;

  final List<String> _categories = [
    'Climate Action',
    'Energi Terbarukan',
    'Reboisasi',
    'Sampah',
    'Keanekaragaman Hayati',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();
    _contentController.addListener(() {
      final text = _contentController.text.trim();
      final words = text.isEmpty
          ? 0
          : text.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
      setState(() => _wordCount = words);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _tagController.dispose();
    _referenceController.dispose();
    super.dispose();
  }

  void _addTag() {
    final tag = _tagController.text.trim();
    if (tag.isEmpty) return;
    if (_tags.length >= 5) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Maksimal 5 tag')));
      return;
    }
    if (_tags.contains(tag)) return;
    setState(() => _tags.add(tag));
    _tagController.clear();
  }

  void _addReference() {
    final ref = _referenceController.text.trim();
    if (ref.isEmpty) return;
    setState(() => _references.add(ref));
    _referenceController.clear();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (_wordCount < 300) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Isi artikel minimal 300 kata. Sekarang: $_wordCount kata.',
          ),
          backgroundColor: Colors.red.shade600,
        ),
      );
      return;
    }

    if (_references.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tambahkan minimal 1 referensi.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!_hasThumbnail) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thumbnail artikel wajib diunggah.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Dummy submit — tampilkan dialog sukses
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        icon: const Icon(
          Icons.check_circle,
          color: Color(0xFF148A43),
          size: 48,
        ),
        title: const Text(
          'Artikel Terkirim!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: const Text(
          'Artikel kamu sedang dalam proses review oleh tim moderator. Akan ditampilkan setelah disetujui.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF148A43),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); // tutup dialog
                Navigator.pop(context); // kembali ke EduHub
              },
              child: const Text('Oke'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF148A43),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Ajukan Artikel',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ── IDENTITAS ──────────────────────────────────────
            _sectionTitle('Identitas Konten'),
            const SizedBox(height: 10),

            // Judul
            _buildLabel('Judul Artikel *'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _titleController,
              style: const TextStyle(fontSize: 13),
              validator: (val) {
                if (val == null || val.isEmpty) return 'Judul wajib diisi';
                if (val.length < 10) return 'Judul minimal 10 karakter';
                return null;
              },
              decoration: _inputDecoration('Masukkan judul artikel'),
            ),
            const SizedBox(height: 14),

            // Kategori
            _buildLabel('Kategori *'),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: _inputDecoration('').copyWith(hintText: null),
              style: const TextStyle(fontSize: 13, color: Colors.black87),
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedCategory = val!),
            ),
            const SizedBox(height: 14),

            // Tags
            _buildLabel('Tag (Opsional, maks. 5)'),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _tagController,
                    style: const TextStyle(fontSize: 13),
                    decoration: _inputDecoration('Tambah tag...'),
                    onSubmitted: (_) => _addTag(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTag,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF148A43),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  child: const Text('+ Tambah'),
                ),
              ],
            ),
            if (_tags.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: _tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag, style: const TextStyle(fontSize: 12)),
                        deleteIcon: const Icon(Icons.close, size: 14),
                        onDeleted: () => setState(() => _tags.remove(tag)),
                        backgroundColor: const Color(
                          0xFF148A43,
                        ).withValues(alpha: 0.1),
                        labelStyle: const TextStyle(color: Color(0xFF148A43)),
                        side: const BorderSide(
                          color: Color(0xFF148A43),
                          width: 0.5,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],

            const SizedBox(height: 20),

            // ── ISI KONTEN ─────────────────────────────────────
            _sectionTitle('Isi Konten'),
            const SizedBox(height: 10),

            // Word count indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel('Isi Artikel *'),
                Text(
                  '$_wordCount / 300 kata',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _wordCount >= 300
                        ? const Color(0xFF148A43)
                        : Colors.orange.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: (_wordCount / 300).clamp(0.0, 1.0),
              backgroundColor: Colors.grey.shade200,
              color: _wordCount >= 300
                  ? const Color(0xFF148A43)
                  : Colors.orange.shade400,
              minHeight: 4,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _contentController,
              maxLines: 12,
              style: const TextStyle(fontSize: 13, height: 1.6),
              decoration: _inputDecoration(
                'Tulis isi artikel di sini... (minimal 300 kata)',
              ),
              validator: (val) {
                if (val == null || val.isEmpty)
                  return 'Isi artikel wajib diisi';
                return null;
              },
            ),

            const SizedBox(height: 20),

            // ── REFERENSI ──────────────────────────────────────
            _sectionTitle('Referensi'),
            const SizedBox(height: 10),
            _buildLabel('Sumber Referensi * (min. 1)'),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _referenceController,
                    style: const TextStyle(fontSize: 13),
                    decoration: _inputDecoration('URL atau sitasi teks...'),
                    onSubmitted: (_) => _addReference(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addReference,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF148A43),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  child: const Text('+ Tambah'),
                ),
              ],
            ),
            if (_references.isNotEmpty) ...[
              const SizedBox(height: 10),
              ..._references.asMap().entries.map(
                (entry) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '[${entry.key + 1}]',
                        style: const TextStyle(
                          color: Color(0xFF148A43),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            setState(() => _references.removeAt(entry.key)),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 20),

            // ── MEDIA ──────────────────────────────────────────
            _sectionTitle('Media'),
            const SizedBox(height: 10),
            _buildLabel('Thumbnail *'),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () => setState(() => _hasThumbnail = !_hasThumbnail),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 130,
                decoration: BoxDecoration(
                  color: _hasThumbnail
                      ? const Color(0xFF148A43).withValues(alpha: 0.08)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _hasThumbnail
                        ? const Color(0xFF148A43)
                        : Colors.grey.shade300,
                    width: _hasThumbnail ? 1.5 : 1,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _hasThumbnail
                            ? Icons.check_circle
                            : Icons.add_photo_alternate_outlined,
                        size: 36,
                        color: _hasThumbnail
                            ? const Color(0xFF148A43)
                            : Colors.grey.shade400,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _hasThumbnail
                            ? 'Thumbnail dipilih ✓'
                            : 'Ketuk untuk pilih thumbnail',
                        style: TextStyle(
                          fontSize: 13,
                          color: _hasThumbnail
                              ? const Color(0xFF148A43)
                              : Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── TOMBOL KIRIM ───────────────────────────────────
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF148A43),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Ajukan Artikel',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1A1A1A),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFF444444),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 13, color: Colors.black38),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF148A43), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }
}
