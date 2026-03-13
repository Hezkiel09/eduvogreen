# EduVoGreen 🌱

A new Flutter project.
Aplikasi edukasi dan volunteer berbasis komunitas untuk lingkungan hijau. Dibangun dengan Flutter & Supabase.

## Getting Started
[![Flutter](https://flutter.dev/images/flutter-logo-sharing.png)](https://flutter.dev)

This project is a starting point for a Flutter application.
## 🚀 Fitur-Fitur Aplikasi

A few resources to get you started if this is your first Flutter project:
### **MVP Features** ⭐
- **Authentication** (MVP): Login/register email-password, forgot/reset password via Supabase Auth
- **Volunteer Events** (MVP): List events, detail, join/report dengan image picker
- **EduHub Articles** (MVP): Browse, admin CRUD (tambah/tinjau/revisi/detail)
- **Admin Dashboard** (MVP): Stats, manage articles/volunteers, laporan masalah

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
### **Additional Features**
- Profile management
- Onboarding & interest selection (`minat.dart`)
- Bottom navigation, responsive tabs/popups
- Multi-role access (User/Admin)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
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
| **Web** | ✅ Ready |

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
