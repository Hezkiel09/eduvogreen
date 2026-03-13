# EduVoGreen 🌱

A new Flutter project.
Aplikasi edukasi dan volunteer berbasis komunitas untuk lingkungan hijau. Dibangun dengan **Flutter & Supabase**.

## 🚀 Fitur-Fitur Aplikasi

### **MVP Features**
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


| Layer | Tech | Versi | Fungsi |
|-------|------|-------|--------|
| **Framework** | Flutter + Dart | sdk ^3.10.7 | UI cross-platform (Android/Web) |
| **UI/Styling** | Material Design, Google Fonts (Montserrat), Assets (PNG icons/images) | google_fonts ^8.0.2 / cupertino_icons ^1.0.8 | Theme hijau, responsive widgets |
| **State Management** | Flutter Bloc/Cubit + RepositoryProvider | flutter_bloc ^9.1.1 | AuthCubit, ArticleCubit; DI via MultiBlocProvider |
| **Backend/Database** | Supabase | ^2.12.0 | Auth, Realtime DB, Storage (images) |
| **Navigation** | Named Routes (MaterialApp.routes) | app_routes.dart | /login → /home → /volunteer/eduhub/profile |
| **Utilities** | image_picker, intl | ^1.1.2 / ^0.18.1 | Upload foto, date formatting |
| **Fonts/Assets** | Custom Montserrat fonts, 50+ PNG | - | Icons, backgrounds, badges |

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

## 🚀 Alur Aplikasi (App Flow)
```
1. main.dart (Entry Point)
   ↓ Init async
2. SupabaseConfig.init() → Connect ke project Supabase
   ↓ Auth listener (onAuthStateChange)
3. AppProviders (MultiBlocProvider + MultiRepositoryProvider)
   ├── AuthCubit (login/register/logout)
   ├── ArticleCubit + ArticleService (CRUD articles)
4. MaterialApp (theme hijau, initialRoute: '/login')
   ↓ Routes dari app_routes.dart
Auth Flow:
   /login → AuthCubit.signIn() → Supabase.auth.signInWithPassword()
   ↓ Success → /minat → /home (bottom nav)
   ├── /home → Volunteer/Eduhub/Profile
   ├── /volunteer → Events, report (image_picker → Supabase storage)
   └── /eduhub → Articles via ArticleCubit
Admin: /admin/dashboard → CRUD articles/volunteers
Reset: /forgot-password → /reset-password (deep link)
```

## 📊 Data Flow (State + Backend)
```
UI Widget → BlocBuilder → Cubit.event → Supabase.query → State.emit → UI Update
e.g. Login: Screen → AuthLoginEvent → supabase.auth.signIn() → AuthLoggedInState
Image: image_picker → Supabase.storage.upload()
```

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
flutter run -d chrome  # Web
```

## 📚 Additional Docs
- [Pubspec Dependencies](./pubspec.yaml)

## 🤝 Contributing
1. Fork project
2. Create feature branch
3. `flutter analyze` & `flutter test`
4. Submit PR

---

**Built with ❤️ by EduVoGreen Team**
