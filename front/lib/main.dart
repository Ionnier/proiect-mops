import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:front/data/books_repository.dart';
import 'package:front/data/rental_repository.dart';
import 'package:front/ui/dashboard/dashboard_screen.dart';
import 'package:front/data/auth_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/ui/home_screen.dart';
import 'package:front/ui/signup/signup_vm.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings().initialise();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => SignUpViewModel(
              authRepository: AuthRepository(
                  AuthServiceImpl(dio: Settings().provideDio()), Settings()))),
      Provider<BaseCacheManager>(create: (context) => DefaultCacheManager()),
      Provider<BooksRepository>(
          create: (context) => BooksRepository(Settings())),
      Provider<RentalRepository>(
          create: (context) => RentalRepository(Settings()))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Settings().getApiKey() != null
          ? const DashboardScreen()
          : const HomeScreen(),
    );
  }
}
