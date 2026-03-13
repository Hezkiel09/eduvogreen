# EduVoGreen 🌱

Aplikasi edukasi dan volunteer berbasis komunitas untuk lingkungan hijau. Dibangun dengan Flutter & Supabase.

[![Flutter](https://flutter.dev/images/flutter-logo-sharing.png)](https://flutter.dev)

## 🚀 Fitur-Fitur Aplikasi

### **MVP Features** ⭐
- **Authentication** (MVP): Login/register email-password, forgot/reset password via Supabase Auth
- **Volunteer Events** (MVP): List events, detail, join/report dengan image picker
- **EduHub Articles** (MVP): Browse, admin CRUD (tambah/tinjau/revisi/detail)
- **Admin Dashboard** (MVP): Stats, manage articles/volunteers, laporan masalah

### **Additional Features**
- Profile management
- Onboarding & interest selection (`minat.dart`)
- Bottom navigation, responsive tabs/popups
- Multi-role access (User/Admin)

## 🛠️ Tech Stack
Lihat detail di [TECH_STACK.md](./TECH_STACK.md)

**Ringkasan:**
| Category | Technologies |
|----------|--------------|
| **Framework** | Flutter (Dart) |
| **State Mgmt** | Flutter Bloc + Cubits |
| **Backend** | Supabase (Auth/DB) |
| **UI** | Material Design, Google Fonts (Montserrat) |
| **Utils** | image_picker, intl |

## 🏗️ Arsitektur Aplikasi
```
Flutter App
├── UI Layer (Screens/Widgets)
├── BLoC Layer (Cubits: AuthCubit, ArticleCubit)
├── Repository Layer (ArticleService, AuthService)
├── Data Layer (Models, Supabase Client)
└── Core (Providers, Routes, Config)
```
- **Clean Architecture** inspired: Separation of concerns
- **Dependency Injection**: MultiBlocProvider + RepositoryProvider
- **Navigation**: Named routes di `app_routes.dart`
- **State**: Reactive dengan BlocListener/BlocBuilder

## 📱 Platform Support
| Platform | Status |
|----------|--------|
| **Android** | ✅ Ready |
| **iOS** | ✅ Ready |
| **Web** | ✅ Ready |
| **Windows** | ✅ Ready |
| **macOS** | ✅ Ready |
| **Linux** | ✅ Ready |

## 🏁 Getting Started

### Prerequisites
- Flutter SDK (^3.10.7)
- Supabase project (keys di `lib/core/supabase_client.dart`)

### Installation
```bash
flutter pub get
flutter run
```

### Run on specific platform
```bash
flutter run -d chrome     # Web
flutter run -d windows    # Windows
flutter run -d macos      # macOS
```

## 📚 Additional Docs
- [Tech Stack Detail](./TECH_STACK.md)
- [Analysis Options](./analysis_options.yaml)
- [Pubspec Dependencies](./pubspec.yaml)

## 🤝 Contributing
1. Fork project
2. Create feature branch
3. `flutter analyze` & `flutter test`
4. Submit PR

## 📄 License
This project is proprietary.

---

**Built with ❤️ by EduVoGreen Team**

