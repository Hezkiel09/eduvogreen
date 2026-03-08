class ArticleModel {
  final String id;
  final String title;
  final String category;
  final List<String> tags;
  final String thumbnail; // path asset atau URL
  final String content;
  final List<String> references;
  final String authorName;
  final String authorType; // 'Admin' atau 'Kontributor Komunitas'
  final String publishDate;
  final int readTimeMinutes;
  bool isBookmarked;

  ArticleModel({
    required this.id,
    required this.title,
    required this.category,
    required this.tags,
    required this.thumbnail,
    required this.content,
    required this.references,
    required this.authorName,
    required this.authorType,
    required this.publishDate,
    required this.readTimeMinutes,
    this.isBookmarked = false,
  });
}

// ============================================================
// DATA DUMMY — ganti dengan fetch Supabase nanti
// ============================================================
final List<ArticleModel> dummyArticles = [
  ArticleModel(
    id: '1',
    title: 'Dampak Pemanasan Global terhadap Perubahan Cuaca Ekstrem',
    category: 'Climate Action',
    tags: ['pemanasan global', 'cuaca ekstrem', 'lingkungan'],
    thumbnail: '',
    content:
        '''Pemanasan global adalah fenomena peningkatan suhu rata-rata permukaan Bumi yang disebabkan oleh peningkatan konsentrasi gas rumah kaca di atmosfer. Fenomena ini telah menjadi salah satu tantangan terbesar yang dihadapi umat manusia pada abad ke-21.

Gas rumah kaca seperti karbon dioksida (CO₂), metana (CH₄), dan nitrogen dioksida (N₂O) terperangkap di atmosfer dan mencegah panas matahari keluar kembali ke luar angkasa. Akibatnya, suhu Bumi terus meningkat secara bertahap namun konsisten.

Dampak yang paling terasa adalah perubahan pola cuaca yang tidak menentu. Beberapa wilayah mengalami kekeringan ekstrem yang berkepanjangan, sementara wilayah lain menghadapi banjir besar yang semakin sering terjadi. Badai tropis juga semakin intens dan lebih sering muncul dibandingkan beberapa dekade lalu.

Di Indonesia sendiri, dampak pemanasan global sudah sangat terasa. Naiknya permukaan air laut mengancam pulau-pulau kecil dan daerah pesisir. Penelitian menunjukkan bahwa permukaan laut di sekitar Indonesia naik sekitar 5-7 mm per tahun, jauh di atas rata-rata global.

Selain itu, musim hujan dan kemarau menjadi semakin tidak terprediksi. Para petani menghadapi kesulitan dalam menentukan waktu tanam yang tepat karena perubahan pola musim yang tidak lagi konsisten seperti dahulu.

Untuk mengatasi permasalahan ini, diperlukan aksi nyata dari berbagai pihak. Pemerintah perlu membuat kebijakan yang mendukung energi terbarukan dan mengurangi emisi karbon. Di tingkat individu, kita bisa berkontribusi dengan menggunakan transportasi umum, mengurangi konsumsi plastik, dan mendukung gerakan penghijauan.

Generasi muda memiliki peran penting dalam perjuangan melawan pemanasan global. Dengan memahami dampaknya dan mengambil tindakan nyata, kita bisa menciptakan masa depan yang lebih baik untuk bumi dan generasi yang akan datang.''',
    references: [
      'IPCC. (2021). Climate Change 2021: The Physical Science Basis. Cambridge University Press.',
      'BMKG. (2023). Laporan Iklim Indonesia. bmkg.go.id',
    ],
    authorName: 'Abdul Aziz',
    authorType: 'Admin',
    publishDate: '28 Februari 2026',
    readTimeMinutes: 5,
    isBookmarked: false,
  ),
  ArticleModel(
    id: '2',
    title: 'Cara Mengurangi Sampah Plastik dari Rumah Tanggamu',
    category: 'Sampah',
    tags: ['plastik', 'zero waste', 'daur ulang'],
    thumbnail: '',
    content:
        '''Sampah plastik menjadi salah satu masalah lingkungan paling kritis yang dihadapi dunia saat ini. Setiap tahun, diperkirakan lebih dari 8 juta ton plastik berakhir di lautan, membunuh jutaan hewan laut dan merusak ekosistem bahari.

Kabar baiknya, kita bisa memulai perubahan dari rumah masing-masing. Langkah-langkah sederhana namun konsisten dapat membuat perbedaan yang signifikan dalam jangka panjang.

Pertama, kurangi penggunaan kantong plastik sekali pakai. Ganti dengan tas belanja kain yang bisa dipakai berkali-kali. Satu tas kain dapat menggantikan ratusan kantong plastik dalam seumur hidupnya.

Kedua, hindari penggunaan sedotan plastik. Gunakan sedotan stainless steel, bambu, atau kertas sebagai alternatif. Meski terlihat kecil, mengurangi penggunaan sedotan bisa menghemat ratusan gram plastik per orang per tahun.

Ketiga, pilih produk dengan kemasan minimal atau kemasan yang dapat didaur ulang. Saat berbelanja, perhatikan label kemasan dan prioritaskan produk yang ramah lingkungan.

Keempat, pisahkan sampah di rumah. Buat tiga tempat sampah: organik, anorganik (plastik, kertas, logam), dan B3 (bahan berbahaya dan beracun). Sampah yang sudah dipilah lebih mudah didaur ulang dan tidak mencemari lingkungan.

Kelima, kompos sampah organik. Sisa makanan dan bahan organik lainnya bisa diolah menjadi kompos yang berguna untuk tanaman. Ini juga mengurangi volume sampah yang masuk ke TPA.

Dengan menerapkan langkah-langkah ini, kita turut berkontribusi dalam mengurangi beban sampah plastik. Ingat, setiap tindakan kecil yang konsisten akan memberikan dampak besar bagi lingkungan kita.''',
    references: [
      'WWF Indonesia. (2022). Plastik: Krisis yang Kita Ciptakan. wwf.id',
      'Kementerian Lingkungan Hidup. (2023). Pedoman Pengelolaan Sampah Rumah Tangga.',
    ],
    authorName: 'Joko Santoso',
    authorType: 'Kontributor Komunitas',
    publishDate: '25 Februari 2026',
    readTimeMinutes: 4,
    isBookmarked: true,
  ),
  ArticleModel(
    id: '3',
    title: 'Energi Terbarukan: Masa Depan Bebas Karbon Indonesia',
    category: 'Energi Terbarukan',
    tags: ['solar panel', 'angin', 'energi hijau'],
    thumbnail: '',
    content:
        '''Indonesia memiliki potensi energi terbarukan yang sangat besar. Sebagai negara tropis dengan garis pantai terpanjang kedua di dunia, kita memiliki sumber energi surya, angin, air, dan geotermal yang melimpah.

Saat ini, pembangkit listrik Indonesia masih sangat bergantung pada bahan bakar fosil, terutama batubara. Namun, transisi menuju energi terbarukan bukan lagi pilihan, melainkan keharusan untuk memastikan masa depan yang berkelanjutan.

Panel surya adalah salah satu teknologi energi terbarukan yang paling menjanjikan untuk Indonesia. Dengan tingkat paparan matahari yang tinggi sepanjang tahun, Indonesia memiliki kondisi ideal untuk pengembangan energi surya. Biaya panel surya juga terus turun, menjadikannya pilihan yang semakin terjangkau.

Energi angin juga memiliki potensi besar, terutama di wilayah Indonesia timur seperti Nusa Tenggara, Sulawesi, dan Maluku. Kecepatan angin di wilayah-wilayah ini cukup konsisten untuk mendukung pembangkit listrik tenaga angin skala besar.

Geotermal adalah sumber energi terbarukan lain yang melimpah di Indonesia. Dengan posisinya di ring of fire, Indonesia memiliki sekitar 40% dari total cadangan geotermal dunia. Saat ini, baru sebagian kecil yang telah dikembangkan.

Transisi ke energi terbarukan tidak hanya baik untuk lingkungan, tetapi juga untuk perekonomian. Industri energi terbarukan menciptakan lapangan kerja baru dan mengurangi ketergantungan pada impor bahan bakar fosil.

Sebagai individu, kita bisa mendukung transisi ini dengan menggunakan listrik secara bijak, mendukung kebijakan pro-lingkungan, dan bila memungkinkan, memasang panel surya di rumah.''',
    references: [
      'ESDM. (2023). Rencana Umum Energi Nasional. esdm.go.id',
      'IRENA. (2022). Renewable Energy Prospects: Indonesia. irena.org',
    ],
    authorName: 'Siti Rahayu',
    authorType: 'Admin',
    publishDate: '20 Februari 2026',
    readTimeMinutes: 6,
    isBookmarked: false,
  ),
  ArticleModel(
    id: '4',
    title: 'Reboisasi: Mengembalikan Hutan yang Hilang',
    category: 'Reboisasi',
    tags: ['hutan', 'pohon', 'penghijauan', 'konservasi'],
    thumbnail: '',
    content:
        '''Hutan Indonesia pernah menjadi yang terluas kedua di dunia, namun deforestasi selama beberapa dekade terakhir telah menggerus luasnya secara drastis. Reboisasi atau penanaman kembali hutan menjadi salah satu upaya terpenting dalam memulihkan ekosistem yang rusak.

Hutan bukan sekadar kumpulan pohon. Hutan adalah ekosistem kompleks yang mendukung kehidupan jutaan spesies, mengatur siklus air, menyerap karbon dioksida, dan melindungi tanah dari erosi. Hilangnya hutan berarti hilangnya semua fungsi vital ini.

Program reboisasi yang berhasil memerlukan lebih dari sekadar menanam pohon. Pemilihan spesies yang tepat dan sesuai dengan ekosistem lokal sangat penting. Pohon asli daerah setempat lebih mudah tumbuh dan lebih bermanfaat bagi keanekaragaman hayati dibandingkan spesies asing.

Keterlibatan masyarakat lokal adalah kunci keberhasilan reboisasi. Ketika masyarakat merasa memiliki dan mendapat manfaat dari hutan yang ditanam, mereka akan lebih termotivasi untuk merawat dan melindunginya. Program hutan kemasyarakatan yang menggabungkan konservasi dengan pemberdayaan ekonomi terbukti lebih berhasil.

Di Kota Malang dan sekitarnya, berbagai komunitas lingkungan aktif menjalankan program penanaman pohon. Kamu bisa berpartisipasi dalam kegiatan ini sebagai bentuk nyata kepedulian terhadap lingkungan.

Setiap pohon yang ditanam adalah investasi untuk masa depan. Pohon yang hari ini kamu tanam mungkin baru memberikan manfaat penuh setelah puluhan tahun, namun itulah warisan terbaik yang bisa kita berikan kepada generasi mendatang.''',
    references: [
      'KLHK. (2023). Status Hutan dan Kehutanan Indonesia. menlhk.go.id',
      'FAO. (2022). Global Forest Resources Assessment. fao.org',
    ],
    authorName: 'Budi Hartono',
    authorType: 'Kontributor Komunitas',
    publishDate: '15 Februari 2026',
    readTimeMinutes: 5,
    isBookmarked: false,
  ),
];
